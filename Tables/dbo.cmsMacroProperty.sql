CREATE TABLE [dbo].[cmsMacroProperty] (
  [id] [int] IDENTITY,
  [uniquePropertyId] [uniqueidentifier] NOT NULL,
  [editorAlias] [nvarchar](255) NOT NULL,
  [macro] [int] NOT NULL,
  [macroPropertySortOrder] [int] NOT NULL CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder] DEFAULT ('0'),
  [macroPropertyAlias] [nvarchar](50) NOT NULL,
  [macroPropertyName] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsMacroProperty_Alias]
  ON [dbo].[cmsMacroProperty] ([macro], [macroPropertyAlias])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsMacroProperty_UniquePropertyId]
  ON [dbo].[cmsMacroProperty] ([uniquePropertyId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsMacroProperty]
  ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [dbo].[cmsMacro] ([id])
GO