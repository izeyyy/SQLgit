CREATE TABLE [dbo].[umbracoCreatedPackageSchema] (
  [id] [int] IDENTITY,
  [name] [nvarchar](255) NOT NULL,
  [value] [nvarchar](max) NOT NULL,
  [updateDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoCreatedPackageSchema_updateDate] DEFAULT (getdate()),
  [packageId] [uniqueidentifier] NOT NULL,
  CONSTRAINT [PK_umbracoCreatedPackageSchema] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoCreatedPackageSchema_Name]
  ON [dbo].[umbracoCreatedPackageSchema] ([name])
  ON [PRIMARY]
GO