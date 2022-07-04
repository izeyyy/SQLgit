CREATE TABLE [dbo].[cmsMemberType] (
  [pk] [int] IDENTITY,
  [NodeId] [int] NOT NULL,
  [propertytypeId] [int] NOT NULL,
  [memberCanEdit] [bit] NOT NULL CONSTRAINT [DF_cmsMemberType_memberCanEdit] DEFAULT ('0'),
  [viewOnProfile] [bit] NOT NULL CONSTRAINT [DF_cmsMemberType_viewOnProfile] DEFAULT ('0'),
  [isSensitive] [bit] NOT NULL CONSTRAINT [DF_cmsMemberType_isSensitive] DEFAULT ('0'),
  CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED ([pk])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsMemberType]
  ADD CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY ([NodeId]) REFERENCES [dbo].[cmsContentType] ([nodeId])
GO

ALTER TABLE [dbo].[cmsMemberType]
  ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO