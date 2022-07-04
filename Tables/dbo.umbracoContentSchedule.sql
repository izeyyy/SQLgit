CREATE TABLE [dbo].[umbracoContentSchedule] (
  [id] [uniqueidentifier] NOT NULL,
  [nodeId] [int] NOT NULL,
  [languageId] [int] NULL,
  [date] [datetime] NOT NULL,
  [action] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoContentSchedule]
  ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId])
GO

ALTER TABLE [dbo].[umbracoContentSchedule]
  ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO