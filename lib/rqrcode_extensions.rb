class RQRCode::QRCode
    def dark?(x, y)
      self.module_value(x, y) == 1
    end
  end
  