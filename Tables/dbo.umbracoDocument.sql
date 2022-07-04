CREATE TABLE [dbo].[umbracoDocument] (
  [nodeId] [int] NOT NULL,
  [published] [bit] NOT NULL,
  [edited] [bit] NOT NULL,
  CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED ([nodeId])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoDocument_Published]
  ON [dbo].[umbracoDocument] ([published])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoDocument]
  ADD CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId])
GO