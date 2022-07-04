CREATE TABLE [dbo].[umbracoLock] (
  [id] [int] NOT NULL,
  [value] [int] NOT NULL,
  [name] [nvarchar](64) NOT NULL,
  CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO