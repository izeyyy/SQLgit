CREATE TABLE [dbo].[cmsTemplate] (
  [pk] [int] IDENTITY,
  [nodeId] [int] NOT NULL,
  [alias] [nvarchar](100) NULL,
  CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED ([pk])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId]
  ON [dbo].[cmsTemplate] ([nodeId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsTemplate]
  ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO