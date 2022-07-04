CREATE TABLE [dbo].[umbracoRelation] (
  [id] [int] IDENTITY,
  [parentId] [int] NOT NULL,
  [childId] [int] NOT NULL,
  [relType] [int] NOT NULL,
  [datetime] [datetime] NOT NULL CONSTRAINT [DF_umbracoRelation_datetime] DEFAULT (getdate()),
  [comment] [nvarchar](1000) NOT NULL,
  CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoRelation_parentChildType]
  ON [dbo].[umbracoRelation] ([parentId], [childId], [relType])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoRelation] WITH NOCHECK
  ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoRelation] WITH NOCHECK
  ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoRelation] WITH NOCHECK
  ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [dbo].[umbracoRelationType] ([id])
GO