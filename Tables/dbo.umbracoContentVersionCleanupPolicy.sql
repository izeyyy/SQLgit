CREATE TABLE [dbo].[umbracoContentVersionCleanupPolicy] (
  [contentTypeId] [int] NOT NULL,
  [preventCleanup] [bit] NOT NULL,
  [keepAllVersionsNewerThanDays] [int] NULL,
  [keepLatestVersionPerDayForDays] [int] NULL,
  [updated] [datetime] NOT NULL
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoContentVersionCleanupPolicy]
  ADD CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [dbo].[cmsContentType] ([nodeId]) ON DELETE CASCADE
GO