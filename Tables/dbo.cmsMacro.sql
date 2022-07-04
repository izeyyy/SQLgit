CREATE TABLE [dbo].[cmsMacro] (
  [id] [int] IDENTITY,
  [uniqueId] [uniqueidentifier] NOT NULL,
  [macroUseInEditor] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroUseInEditor] DEFAULT ('0'),
  [macroRefreshRate] [int] NOT NULL CONSTRAINT [DF_cmsMacro_macroRefreshRate] DEFAULT ('0'),
  [macroAlias] [nvarchar](255) NOT NULL,
  [macroName] [nvarchar](255) NULL,
  [macroCacheByPage] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroCacheByPage] DEFAULT ('1'),
  [macroCachePersonalized] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroCachePersonalized] DEFAULT ('0'),
  [macroDontRender] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroDontRender] DEFAULT ('0'),
  [macroSource] [nvarchar](255) NOT NULL,
  [macroType] [int] NOT NULL,
  CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsMacro_UniqueId]
  ON [dbo].[cmsMacro] ([uniqueId])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsMacroPropertyAlias]
  ON [dbo].[cmsMacro] ([macroAlias])
  ON [PRIMARY]
GO