// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Button {
    /// Botón borde
    internal static let bordered = L10n.tr("Localizable", "button.bordered", fallback: "Botón borde")
    /// Botón relleno
    internal static let filled = L10n.tr("Localizable", "button.filled", fallback: "Botón relleno")
    /// Botón relleno con sombra
    internal static let filledShadow = L10n.tr("Localizable", "button.filled_shadow", fallback: "Botón relleno con sombra")
    /// Botones
    internal static let title = L10n.tr("Localizable", "button.title", fallback: "Botones")
  }
  internal enum General {
    /// Atrás
    internal static let back = L10n.tr("Localizable", "general.back", fallback: "Atrás")
    /// Cancelar
    internal static let cancel = L10n.tr("Localizable", "general.cancel", fallback: "Cancelar")
    /// Editar
    internal static let edit = L10n.tr("Localizable", "general.edit", fallback: "Editar")
  }
  internal enum Home {
    /// Buttons
    internal static let buttonOption = L10n.tr("Localizable", "home.button_option", fallback: "Buttons")
    /// Collection Views
    internal static let collectionOption = L10n.tr("Localizable", "home.collection_option", fallback: "Collection Views")
    /// Images
    internal static let imageOption = L10n.tr("Localizable", "home.image_option", fallback: "Images")
    /// Labels
    internal static let labelOption = L10n.tr("Localizable", "home.label_option", fallback: "Labels")
    /// Barras de progreso
    internal static let progressBarOption = L10n.tr("Localizable", "home.progress_bar_option", fallback: "Barras de progreso")
    /// Switchs
    internal static let switchOption = L10n.tr("Localizable", "home.switch_option", fallback: "Switchs")
    /// Table Views
    internal static let tableOption = L10n.tr("Localizable", "home.table_option", fallback: "Table Views")
    /// Text Fields
    internal static let textfieldOption = L10n.tr("Localizable", "home.textfield_option", fallback: "Text Fields")
    /// UI Components
    internal static let title = L10n.tr("Localizable", "home.title", fallback: "UI Components")
    /// Toasts
    internal static let toastOption = L10n.tr("Localizable", "home.toast_option", fallback: "Toasts")
    /// Views
    internal static let viewOption = L10n.tr("Localizable", "home.view_option", fallback: "Views")
    /// Web Views
    internal static let webOption = L10n.tr("Localizable", "home.web_option", fallback: "Web Views")
  }
  internal enum Images {
    /// Imagenes
    internal static let title = L10n.tr("Localizable", "images.title", fallback: "Imagenes")
  }
  internal enum Label {
    /// Etiqueta con
    internal static let differentStylesFirst = L10n.tr("Localizable", "label.different_styles_first", fallback: "Etiqueta con")
    ///  diferentes éstilos
    internal static let differentStylesSecond = L10n.tr("Localizable", "label.different_styles_second", fallback: " diferentes éstilos")
    /// Texto tamaño máximo
    internal static let maxWidthLeft = L10n.tr("Localizable", "label.max_width_left", fallback: "Texto tamaño máximo")
    /// Texto derecha
    internal static let maxWidthRight = L10n.tr("Localizable", "label.max_width_right", fallback: "Texto derecha")
    /// Tachado
    internal static let strikethrough = L10n.tr("Localizable", "label.strikethrough", fallback: "Tachado")
    /// Etiquetas
    internal static let title = L10n.tr("Localizable", "label.title", fallback: "Etiquetas")
  }
  internal enum ProgressBar {
    /// Barra gradiente
    internal static let gradient = L10n.tr("Localizable", "progress_bar.gradient", fallback: "Barra gradiente")
    /// Barra redondeada
    internal static let rounded = L10n.tr("Localizable", "progress_bar.rounded", fallback: "Barra redondeada")
    /// Barras de progreso
    internal static let title = L10n.tr("Localizable", "progress_bar.title", fallback: "Barras de progreso")
  }
  internal enum Tableview {
    /// Celdas editables
    internal static let editableCells = L10n.tr("Localizable", "tableview.editable_cells", fallback: "Celdas editables")
    /// Celdas agrandables
    internal static let expandableCells = L10n.tr("Localizable", "tableview.expandable_cells", fallback: "Celdas agrandables")
    /// Secciones reactivas
    internal static let reactiveSections = L10n.tr("Localizable", "tableview.reactive_sections", fallback: "Secciones reactivas")
    /// Encabezados scrolleables
    internal static let scrollableHeaders = L10n.tr("Localizable", "tableview.scrollable_headers", fallback: "Encabezados scrolleables")
    /// Encabezados pegadizos
    internal static let stickyHeaders = L10n.tr("Localizable", "tableview.sticky_headers", fallback: "Encabezados pegadizos")
    /// Celdas desplazables
    internal static let swipeAction = L10n.tr("Localizable", "tableview.swipe_action", fallback: "Celdas desplazables")
    /// Tablas
    internal static let title = L10n.tr("Localizable", "tableview.title", fallback: "Tablas")
    internal enum StickyHeaders {
      /// Botón
      internal static let button = L10n.tr("Localizable", "tableview.sticky_headers.button", fallback: "Botón")
      /// Header 1
      internal static let first = L10n.tr("Localizable", "tableview.sticky_headers.first", fallback: "Header 1")
      /// Header 2
      internal static let second = L10n.tr("Localizable", "tableview.sticky_headers.second", fallback: "Header 2")
    }
  }
  internal enum Textfield {
    /// Email válido
    internal static let emailCorrect = L10n.tr("Localizable", "textfield.email_correct", fallback: "Email válido")
    /// El email ingresado no es válido
    internal static let emailError = L10n.tr("Localizable", "textfield.email_error", fallback: "El email ingresado no es válido")
    /// TextField con etiqueta
    internal static let labeledButton = L10n.tr("Localizable", "textfield.labeled_button", fallback: "TextField con etiqueta")
    /// Nombre válido
    internal static let nameCorrect = L10n.tr("Localizable", "textfield.name_correct", fallback: "Nombre válido")
    /// Ingrese un nombre con al menos 3 caracteres
    internal static let nameEmpty = L10n.tr("Localizable", "textfield.name_empty", fallback: "Ingrese un nombre con al menos 3 caracteres")
    /// El nombre ingresado es demasiado largo
    internal static let nameLargeError = L10n.tr("Localizable", "textfield.name_large_error", fallback: "El nombre ingresado es demasiado largo")
    /// El nombre ingresado es demasiado corto
    internal static let nameSmallError = L10n.tr("Localizable", "textfield.name_small_error", fallback: "El nombre ingresado es demasiado corto")
    /// Teléfono válido
    internal static let phoneCorrect = L10n.tr("Localizable", "textfield.phone_correct", fallback: "Teléfono válido")
    /// El teléfono ingresado no es válido
    internal static let phoneError = L10n.tr("Localizable", "textfield.phone_error", fallback: "El teléfono ingresado no es válido")
    /// Textfield picker
    internal static let pickerButton = L10n.tr("Localizable", "textfield.picker_button", fallback: "Textfield picker")
    /// Rut válido
    internal static let rutCorrect = L10n.tr("Localizable", "textfield.rut_correct", fallback: "Rut válido")
    /// Ingrese un rut sin punto ni guión
    internal static let rutEmpty = L10n.tr("Localizable", "textfield.rut_empty", fallback: "Ingrese un rut sin punto ni guión")
    /// El rut ingresado no es válido
    internal static let rutError = L10n.tr("Localizable", "textfield.rut_error", fallback: "El rut ingresado no es válido")
    /// Campos de texto
    internal static let title = L10n.tr("Localizable", "textfield.title", fallback: "Campos de texto")
  }
  internal enum Views {
    /// Cerrar
    internal static let alertAction = L10n.tr("Localizable", "views.alert_action", fallback: "Cerrar")
    /// La acción de la vista ha sido llamada con éxito
    internal static let alertMessage = L10n.tr("Localizable", "views.alert_message", fallback: "La acción de la vista ha sido llamada con éxito")
    /// Presioname, mira mi función
    internal static let alertText = L10n.tr("Localizable", "views.alert_text", fallback: "Presioname, mira mi función")
    /// Presionaste la vista
    internal static let alertTitle = L10n.tr("Localizable", "views.alert_title", fallback: "Presionaste la vista")
    /// Vista configurada con parámetros
    internal static let configText = L10n.tr("Localizable", "views.config_text", fallback: "Vista configurada con parámetros")
    /// Vista con sombra
    internal static let shadowTitle = L10n.tr("Localizable", "views.shadow_title", fallback: "Vista con sombra")
    /// Vistas
    internal static let title = L10n.tr("Localizable", "views.title", fallback: "Vistas")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
