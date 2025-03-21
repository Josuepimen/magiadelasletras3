extends GPUParticles2D

func _ready():
	# Configurar la rotación inicial (vertical u horizontal)
	rotation_degrees = randf() * 90.0  # Rota entre -90 y 90 grados

func _process(delta: float):
	# Rotación aleatoria
	rotation_degrees += randf() * 10.0  # Ajusta la velocidad de rotación
	rotation_degrees = clamp(rotation_degrees, -90.0, 90.0)  # Limita la rotación entre -90 y 90 grados
	rotation = deg_to_rad(rotation_degrees)  # Convierte a radianes
