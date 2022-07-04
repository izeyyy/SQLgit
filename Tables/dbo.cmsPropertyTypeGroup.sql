CREATE TABLE [dbo].[cmsPropertyTypeGroup] (
  [id] [int] IDENTITY,
  [uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID] DEFAULT (newid()),
  [contenttypeNodeId] [int] NOT NULL,
  [type] [int] NOT NULL CONSTRAINT [DF_cmsPropertyTypeGroup_type] DEFAULT ('0'),
  [text] [nvarchar](255) NOT NULL,
  [alias] [nvarchar](255) NOT NULL,
  [sortorder] [int] NOT NULL,
  CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsPropertyTypeGroupUniqueID]
  ON [dbo].[cmsPropertyTypeGroup] ([uniqueID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsPropertyTypeGroup]
  ADD CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY ([contenttypeNodeId]) REFERENCES [dbo].[cmsContentType] ([nodeId])
GO