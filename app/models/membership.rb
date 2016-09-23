class Membership < ActiveRecord::Base
  belongs_to :society
  has_many :clients

  accepts_nested_attributes_for :clients
  after_create :save_client
  after_create :fechas

  def t_cedula=(cedula)
    @t_c = cedula
  end
  def n_cedula=(numero)
    @numeroC = numero
  end
  def nombreA=(nom)
    @nombreA=nom
  end
  def apellido=(ap)
    @apellido=ap
  end
  def telefono=(tel)
    @telefono=tel
  end
  def direccion=(direc)
    @direccion=direc
  end
  def pais=(pais)
    @pais=pais
  end
  def ciudad=(c)
    @ciudad=c
  end
  def email=(email)
    @email=email
  end
def save_client
  Client.create( documento: @numeroC, tipo_documento: @t_c, nombre: @nombreA, apellido: @apellido, telefono: @telefono, direccion: @direccion, pais: @pais, ciudad: @ciudad, email: @ciudad, membership_id: self.id)
end
  def fechas
    t = Time.new
    self.update(fecha_afiliacion: t)
    if self.periodicidad == 'Anual'
    self.update(fecha_vencimiento: t+(60*60*24*365))
    elsif self.periodicidad == 'Mensual'
      self.update(fecha_vencimiento: t)
      self.update(fecha_cuota: t)
    elsif self.periodicidad == 'Semestral'
      self.update(fecha_cuota: t)

    end

  end
end



