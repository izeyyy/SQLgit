CREATE TABLE [dbo].[cmsContentType2ContentType] (
  [parentContentTypeId] [int] NOT NULL,
  [childContentTypeId] [int] NOT NULL,
  CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED ([parentContentTypeId], [childContentTypeId])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsContentType2ContentType]
  ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[cmsContentType2ContentType]
  ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO