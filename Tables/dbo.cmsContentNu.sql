CREATE TABLE [dbo].[cmsContentNu] (
  [nodeId] [int] NOT NULL,
  [published] [bit] NOT NULL,
  [data] [ntext] NULL,
  [rv] [bigint] NOT NULL,
  [dataRaw] [varbinary](max) NULL,
  CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED ([nodeId], [published])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsContentNu]
  ADD CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId]) ON DELETE CASCADE
GO