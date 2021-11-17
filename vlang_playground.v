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
	c.register('service-a', fn (ctx Context) &di.Service {
		return ServiceA{}
	})
	c.register('service-b', fn (ctx Context) &di.Service {
		service_a := ctx.resolve<ServiceA>('service-a') or { panic('Failed to find service') }

		return ServiceB{service_a}
	})
}
