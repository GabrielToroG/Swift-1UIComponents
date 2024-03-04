// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Home {
    /// Buttons
    internal static let buttonOption = L10n.tr("Localizable", "home.button_option", fallback: "Buttons")
    /// Collection Views
    internal static let collectionOption = L10n.tr("Localizable", "home.collection_option", fallback: "Collection Views")
    /// Images
    internal static let imageOption = L10n.tr("Localizable", "home.image_option", fallback: "Images")
    /// Labels
    internal static let labelOption = L10n.tr("Localizable", "home.label_option", fallback: "Labels")
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
    /// Texto derecho
    internal static let maxWidthRight = L10n.tr("Localizable", "label.max_width_right", fallback: "Texto derecho")
    /// Tachado
    internal static let strikethrough = L10n.tr("Localizable", "label.strikethrough", fallback: "Tachado")
    /// Etiquetas
    internal static let title = L10n.tr("Localizable", "label.title", fallback: "Etiquetas")
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
