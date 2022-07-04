CREATE TABLE [dbo].[umbracoDocumentVersion] (
  [id] [int] NOT NULL,
  [templateId] [int] NULL,
  [published] [bit] NOT NULL,
  CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoDocumentVersion]
  ADD CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY ([templateId]) REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO

ALTER TABLE [dbo].[umbracoDocumentVersion]
  ADD CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [dbo].[umbracoContentVersion] ([id])
GO