module main

import di { Container, Context }

[heap]
struct ServiceA {}

[heap]
struct ServiceB {
	service_a &ServiceA
}

fn main() {
	println('Hello World!')
	nums := []int{len: 10, init: it}
	println(nums)
	dbls := nums.map(it * 2)
	println(dbls)
	sqrs := nums.map(it * it)
	println(sqrs)

	// container section
	c := Container{}
	c.register<ServiceA>('service-a', fn (ctx Context) ServiceA {
		return ServiceA{}
	})
	c.register<ServiceB>('service-b', fn (ctx Context) ServiceB {
		service_a := ctx.resolve<ServiceA>('service-a') or { panic('Failed to find service') }
		return ServiceB{service_a}
	})
}
