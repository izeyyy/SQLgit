CREATE TABLE [dbo].[umbracoContent] (
  [nodeId] [int] NOT NULL,
  [contentTypeId] [int] NOT NULL,
  CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED ([nodeId])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoContent]
  ADD CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [dbo].[cmsContentType] ([nodeId])
GO

ALTER TABLE [dbo].[umbracoContent]
  ADD CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO