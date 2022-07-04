CREATE TABLE [dbo].[umbracoLogViewerQuery] (
  [id] [int] IDENTITY,
  [name] [nvarchar](255) NOT NULL,
  [query] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_umbracoLogViewerQuery] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_LogViewerQuery_name]
  ON [dbo].[umbracoLogViewerQuery] ([name])
  ON [PRIMARY]
GO