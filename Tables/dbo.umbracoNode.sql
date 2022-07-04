CREATE TABLE [dbo].[umbracoNode] (
  [id] [int] IDENTITY,
  [uniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_umbracoNode_uniqueId] DEFAULT (newid()),
  [parentId] [int] NOT NULL,
  [level] [int] NOT NULL,
  [path] [nvarchar](150) NOT NULL,
  [sortOrder] [int] NOT NULL,
  [trashed] [bit] NOT NULL CONSTRAINT [DF_umbracoNode_trashed] DEFAULT ('0'),
  [nodeUser] [int] NULL,
  [text] [nvarchar](255) NULL,
  [nodeObjectType] [uniqueidentifier] NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoNode_createDate] DEFAULT (getdate()),
  CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoNode_Level]
  ON [dbo].[umbracoNode] ([level], [parentId], [sortOrder], [nodeObjectType], [trashed])
  INCLUDE ([nodeUser], [path], [uniqueId], [createDate])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoNode_ObjectType]
  ON [dbo].[umbracoNode] ([nodeObjectType], [trashed])
  INCLUDE ([uniqueId], [parentId], [level], [path], [sortOrder], [nodeUser], [text], [createDate])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoNode_ParentId]
  ON [dbo].[umbracoNode] ([parentId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoNode_Path]
  ON [dbo].[umbracoNode] ([path])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoNode_Trashed]
  ON [dbo].[umbracoNode] ([trashed])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoNode_UniqueId]
  ON [dbo].[umbracoNode] ([uniqueId])
  INCLUDE ([parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [createDate])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoNode]
  ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoNode]
  ADD CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY ([nodeUser]) REFERENCES [dbo].[umbracoUser] ([id])
GO