CREATE TABLE [dbo].[umbracoDocumentCultureVariation] (
  [id] [int] IDENTITY,
  [nodeId] [int] NOT NULL,
  [languageId] [int] NOT NULL,
  [edited] [bit] NOT NULL,
  [available] [bit] NOT NULL,
  [published] [bit] NOT NULL,
  [name] [nvarchar](255) NULL,
  CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoDocumentCultureVariation_LanguageId]
  ON [dbo].[umbracoDocumentCultureVariation] ([languageId])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoDocumentCultureVariation_NodeId]
  ON [dbo].[umbracoDocumentCultureVariation] ([nodeId], [languageId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoDocumentCultureVariation]
  ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO

ALTER TABLE [dbo].[umbracoDocumentCultureVariation]
  ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO