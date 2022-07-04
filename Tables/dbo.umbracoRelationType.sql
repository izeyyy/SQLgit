CREATE TABLE [dbo].[umbracoRelationType] (
  [id] [int] IDENTITY,
  [typeUniqueId] [uniqueidentifier] NOT NULL,
  [dual] [bit] NOT NULL,
  [parentObjectType] [uniqueidentifier] NULL,
  [childObjectType] [uniqueidentifier] NULL,
  [name] [nvarchar](255) NOT NULL,
  [alias] [nvarchar](100) NOT NULL,
  [isDependency] [bit] NOT NULL CONSTRAINT [DF_umbracoRelationType_isDependency] DEFAULT ('0'),
  CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoRelationType_alias]
  ON [dbo].[umbracoRelationType] ([alias])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoRelationType_name]
  ON [dbo].[umbracoRelationType] ([name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoRelationType_UniqueId]
  ON [dbo].[umbracoRelationType] ([typeUniqueId])
  ON [PRIMARY]
GO