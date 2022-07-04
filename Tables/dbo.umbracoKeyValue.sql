CREATE TABLE [dbo].[umbracoKeyValue] (
  [key] [nvarchar](256) NOT NULL,
  [value] [nvarchar](255) NULL,
  [updated] [datetime] NOT NULL CONSTRAINT [DF_umbracoKeyValue_updated] DEFAULT (getdate()),
  CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED ([key])
)
ON [PRIMARY]
GO