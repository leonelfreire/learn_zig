# Aprendendo Zig

## Notas gerais

* Sistema de import: **@import** e **pub**.
* Parâmetros de funções são constantes.
* Não existe sobrecarga de função.
* Tipos são inferidos sempre que possível.

## Structs

### Formato geral

```
pub const S = struct {
    field1: type1 = default,
    field2: type2 = default,
    ...
}
```

* Na criação, todos os campos devem ser preenchidos.
* Structs podem conter métodos, declarações (ex.: outras structs) e pode não conter campos, atuando apenas como um **namespace**:

```zig
pub const User = struct {
	power: u64 = 0,
	name: []const u8,

	pub const SUPER_POWER = 9000;

	pub fn diagnose(user: User) void {
		if (user.power >= SUPER_POWER) {
			std.debug.print("it's over {d}!!!", .{SUPER_POWER});
		}
	}
};
```

* Métodos são apenas funções comuns que podem ser chamados com a sintaxe do ponto (.).

```zig
// call diagnose on user
user.diagnose();

// The above is syntactical sugar for:
User.diagnose(user);
```

* Structs anônimas podem ser usadas no retorno de funções e terão seu tipo inferido de acordo com a declaração da função:

```zig
pub fn init(name: []const u8, power: u64) User {
	// instead of return User{...}
	return .{
		.name = name,
		.power = power,
	};
}
```
