SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Pankaj Sutradhar>
-- Create date: <27/07/2007>
-- Description:	<Capture Template XML>
-- =============================================
CREATE FUNCTION [dbo].[OTL_Capture_TemplateXML]
(
	@templateXML NTEXT,
	@iDoc int 
)
RETURNS  @temp_Table table 
	(
		[Id]					int identity(1,1), 
		[Hdr_app]				nvarchar(500),
		[Hdr_name]				nvarchar(500),
		[Hdr_description]			nvarchar(500),
		[Hdr_author]				nvarchar(500),
		[Hdr_legal]				nvarchar(500),
		[Hdr_ExpectedObjectTypes]		nvarchar(500),
		[Language_output]			nvarchar(500),
		[Language_scripting]			nvarchar(500),		
		[Output_name]				nvarchar(500),
		[Output_path]				nvarchar(500),
		[Output_mode]				nvarchar(500),
		[Output_encoding]			nvarchar(500),
		[Include_filename]			nvarchar(500),
		[Import_namespace]			nvarchar(500),
		[Import_assemblies]			nvarchar(500),
		[Import_templates]			nvarchar(500),
		[templatecode]				ntext
	) 

AS
BEGIN
	
   	-- <header>----------------------
	DECLARE @Hdr_app Nvarchar(500)
	DECLARE @Hdr_name Nvarchar(500)
    	DECLARE @Hdr_description Nvarchar(500)
    	DECLARE @Hdr_author Nvarchar(500)
    	DECLARE @Hdr_legal Nvarchar(500)
	DECLARE @Hdr_ExpectedObjectTypes Nvarchar(500)
	-- </header>----------------------

	-- <languages> ---------------------
	DECLARE @Language_output Nvarchar(500)
	DECLARE @Language_scripting Nvarchar(500)
	-- </languages> ---------------

	-- <outputfile> ---------------
	    DECLARE @Output_name Nvarchar(500)
	    DECLARE @Output_path Nvarchar(500)
	    DECLARE @Output_mode Nvarchar(500)
	    DECLARE @Output_encoding Nvarchar(500)
    	-- </outputfile> --------------

	-- <Import> -------------------
		-- <includes> -----------------
		DECLARE @Include_filename Nvarchar(500)
		-- </includes> ----------------
	    	DECLARE @Import_namespace Nvarchar(500)
	    	DECLARE @Import_assemblies Nvarchar(500)
	   	 DECLARE @Import_templates Nvarchar(500)
	-- </Import> -------------------
  	
	
   	-- Capturing Header info from XML----------------------------
    		SELECT 
			@Hdr_app = app,
			@Hdr_name = [name],
			@Hdr_description = description,
			@Hdr_author = author,
			@Hdr_legal = legal,
			@Hdr_ExpectedObjectTypes = ExpectedObjectTypes
		FROM OpenXML(@iDoc,'template/header',2)
    		WITH 
		(
			app nvarchar(100) 'app',  
	        		[name] nvarchar(100) 'name',
			description nvarchar(100) 'description',
			author nvarchar(100) 'author'	,
			legal nvarchar(100) 'legal',
			ExpectedObjectTypes nvarchar(100) 'ExpectedObjectTypes'
		)	
	------------------------------------------------------------

	-- Capturing Language info from XML---------------------------
    		SELECT 
			@Language_output=[output],
			@Language_scripting=scripting 
		FROM OpenXML(@iDoc,'template/languages',2)
		WITH 
		(
			[output] nvarchar(100) 'output',
			scripting nvarchar(100) 'scripting'
		)
	-------------------------------------------------------------

	-- Capturing outputfile info from XML---------------------------
    	SELECT 
		@Output_name = [name],
		@Output_path = [path],
		@Output_mode = Mode,
		@Output_encoding = Encoding
	FROM OpenXML(@iDoc,'template/outputfile',2)
	WITH 
	(
		[name] nvarchar(100) 'name',
		[path] nvarchar(100) 'path',
		mode nvarchar(100) 'Mode',
		encoding nvarchar(100) 'Encoding'
	)
	-------------------------------------------------------------

	-- Capturing Import/Include info from XML---------------------------
    	SELECT 
		@Include_filename = [filename]
	FROM OpenXML(@iDoc,'template/Import/includes',2)
	WITH 
	(
		[filename] nvarchar(100) 'filename'
	)
	-------------------------------------------------------------

	-- Capturing Import info from XML---------------------------
    	SELECT 
		@Import_namespace = Namespaces,
		@Import_assemblies = Assemblies,
		@Import_templates = Templates
	FROM OpenXML(@iDoc,'template/Import',2)
	WITH 
	(
		[namespaces] nvarchar(100) 'Namespaces',
		[assemblies] nvarchar(100) 'Assemblies',
		templates nvarchar(100) 'Templates'
	)
	-------------------------------------------------------------

	-- Capturing templatecode and Inserting intotempTable--------
	INSERT INTO @temp_Table
	(
		[Hdr_app],
		[Hdr_name],
		[Hdr_description],
		[Hdr_author],
		[Hdr_legal],
		[Hdr_ExpectedObjectTypes],
		[Language_output],
		[Language_scripting],		
		[Output_name],
		[Output_path],
		[Output_mode],
		[Output_encoding],
		[Include_filename],
		[Import_namespace],
		[Import_assemblies],
		[Import_templates],
		[templatecode]
	)
	SELECT 
		@Hdr_app,
		@Hdr_name,
    		@Hdr_description,
   		@Hdr_author,
    		@Hdr_legal,
		@Hdr_ExpectedObjectTypes,
		@Language_output,
		@Language_scripting,
		@Output_name,
		@Output_path,
		@Output_mode,
		@Output_encoding,
		@Include_filename,
		@Import_namespace,
		@Import_assemblies,
		@Import_templates,
		templatecode
	FROM OpenXML(@iDoc,'/template',2)
	WITH 
	(
		templatecode ntext 'templatecode'
	)
	-------------------------------------------------------------
		
	RETURN 
END






GO
