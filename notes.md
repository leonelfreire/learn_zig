# Aprendendo Zig

## Pesquisar

* Tudo que é possível fazer com a struct anônima. Até agora já vi que pode inicializar array, structs, servir como agrupador para múltiplos parâmetros etc.

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

## Arrays

* Arrays devem ter um tamanho fixo e conhecido em tempo de compilação.

### Formas de inicializar um array

```zig
const a = [5]i32{ 1, 2, 3, 4, 5 };
const b: [5]i32 = .{ 1, 2, 3, 4, 5 };
const c = [_]i32{ 1, 2, 3, 4, 5 };
```

## Slices

* O slice é um *fat pointer* com um ponteiro para um array e um tamanho.

### Conversão automática do compilador

```zig
const a = [_]i32{ 1, 2, 3, 4, 5 };
const b = a[1..4];
// const b: *const [3]i32 = a[1..4];
```
* `b` não é um slice, pois seu tipo e tamanho é conhecido em tempo de compilação, tornando-se então um ponteiro para um array const de 4 itens: `*const [3]i32`.
* Para definir `b`como um slice, podemos usar o tipo `[]const i32`.


## Strings

* Zig não tem um tipo string.
* Strings nada mais são do que um array ou slice de `u8`.
* Por **convenção** strings deven conter apenas dados UTF-8.
* Strings literais tem são terminadas com o `\0` (null).

Exemplo:

```zig
const s = "Goku";
```

`s` vai ser do tipo `*const [4:0]u8`: ponteiro para um array constante terminado com null.

* Um array tem uma sintaxe mais genérica: `[lenght:sentinel]T`, onde *sentinel* define o que vai finalizar o array.
