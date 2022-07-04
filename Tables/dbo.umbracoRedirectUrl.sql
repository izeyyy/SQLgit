CREATE TABLE [dbo].[umbracoRedirectUrl] (
  [id] [uniqueidentifier] NOT NULL,
  [contentKey] [uniqueidentifier] NOT NULL,
  [createDateUtc] [datetime] NOT NULL,
  [url] [nvarchar](255) NOT NULL,
  [culture] [nvarchar](255) NULL,
  [urlHash] [nvarchar](40) NOT NULL,
  CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoRedirectUrl]
  ON [dbo].[umbracoRedirectUrl] ([urlHash], [contentKey], [culture], [createDateUtc])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoRedirectUrl]
  ADD CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY ([contentKey]) REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO