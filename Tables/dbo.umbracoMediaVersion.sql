CREATE TABLE [dbo].[umbracoMediaVersion] (
  [id] [int] NOT NULL,
  [path] [nvarchar](255) NULL,
  CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoMediaVersion]
  ON [dbo].[umbracoMediaVersion] ([id], [path])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoMediaVersion]
  ADD CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [dbo].[umbracoContentVersion] ([id])
GO