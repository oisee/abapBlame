CLASS zcl_blame_asset_css DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !i_theme TYPE zblame_theme.

    INTERFACES zif_blame_asset .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA g_theme_transformation TYPE char30.
ENDCLASS.



CLASS zcl_blame_asset_css IMPLEMENTATION.
  METHOD constructor.
    g_theme_transformation = |ZBLAME_CSS_THEME_{ i_theme }|.
  ENDMETHOD.


  METHOD zif_blame_asset~get_url.
    r_url = 'abapblame.css'.
  ENDMETHOD.


  METHOD zif_blame_asset~get_subtype.
    r_subtype = 'css'.
  ENDMETHOD.


  METHOD zif_blame_asset~get_content.
    DATA theme_css TYPE string.
    DATA(css) = |<css/>|.

    CALL TRANSFORMATION zblame_css_main
    SOURCE XML css
    RESULT XML r_content.

    CALL TRANSFORMATION (g_theme_transformation)
    SOURCE XML css
    RESULT XML theme_css.

    r_content = |{ r_content }{ theme_css }|.
  ENDMETHOD.
ENDCLASS.
