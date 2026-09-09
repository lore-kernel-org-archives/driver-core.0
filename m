Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED665427F2;
	Wed,  9 Sep 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953366; cv=none; b=RH0kP8ebAAcRD0QXpTaAYD/U2XbTIivvnFpFIie4Fg5HwG3IE6Nua+w+fNnD8T5MzMkySKV88AJoodlaBngixLbVih3YFRKUsAUs2FsQJIAwtPwoNtJgSHBuO9j5FCNKdrUHT+V35zTdgnY4fhNgdU/7Tut/rQ9YA+Kb1Q8j6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953366; c=relaxed/simple;
	bh=5t2lkATIi7BZC0vRD7XUkmgQ9EM3eDdhwa1UQgM9Azs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=s3Bt037BMCPJmHVUbuPhu/TKQn2TbvmIoS5LxA6O19BX/2IC59rd3VkYlTffeCAf/D0j6gNL8lQb7CkWHlhfklAILhfrR/sFG8ei6GiZtOVc16M0DK3MNls9u7Sj7eCBfE0qKd4cCxikw/tiyCtrOxLKWvshmjUFS5gCEIL6hMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad4Cajq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad4Cajq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409141F00A3A;
	Wed,  9 Sep 2026 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953364;
	bh=WC7hKSBtPkgNxzwAYTZWfYgCBEV8gwtgoSM05bxD/M4=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Ad4Cajq9O9K9hG9+AEr7VEyvKeZCvUzHFhYvzSabrKfJBxtuX/PUQViw68Ug8a5gd
	 sErkz7zF5YqaPmV89jsASNjfPOlvszcdTjXuXCzPKX6LuAbOZ+QrlGNuS9ttE7kxM3
	 3qbTSQLrl91S/q0JEie+NcXDUmBAYUE9cIpkBR3ua7GcIQGRlDqBKnPfHDrO6mtN6N
	 nlcyS43VNSbPzjo875DIiptOm7dhd8LPW93Un24LIDf3IpALHH2etNw+pQihePtebJ
	 lVzyVrlprChjXjHuMFZ/qGYBDgURYvERiAj4Spoxs/ptRVtl9ZdEH3rwlMcQKkhCmM
	 Cuzs/bMw0FpxA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 13:29:18 +0200
Message-Id: <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
Cc: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Dave
 Ertman" <david.m.ertman@intel.com>, "Ira Weiny" <iweiny@kernel.org>, "Leon
 Romanovsky" <leon@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh>
In-Reply-To: <2026090955-lustfully-fanning-33f9@gregkh>

On Wed Sep 9, 2026 at 9:19 AM CEST, Greg Kroah-Hartman wrote:
> On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrote:
>> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
>> `auxiliary_device_id::name` array without checking that they fit. An
>> oversized name is caught by the array bounds check, but the error
>> reports an out-of-bounds index in the copy loop rather than the
>> constraint the caller violated.
>>=20
>> Check the invariant explicitly instead, so the failure states the length
>> limit rather than an array index.
>>=20
>> In a constant context exceeding the limit leads to a build error; at
>> runtime it panics, so add a `# Panics` section for it.
>>=20
>> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abs=
tractions")

It's not actually fixing a bug, so I don't think this needs a Fixes: tag.

>> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
>> ---
>>  rust/kernel/auxiliary.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>=20
>> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
>> index 60dfbec8f330..1f3ba86d6d96 100644
>> --- a/rust/kernel/auxiliary.rs
>> +++ b/rust/kernel/auxiliary.rs
>> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
>> =20
>>  impl DeviceId {
>>      /// Create a new [`DeviceId`] from name.
>> +    ///
>> +    /// # Panics
>> +    ///
>> +    /// Panics if the combined module and device name, including the
>> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes=
.

I'd rather document that this is only intended to be called within device I=
D
table creation; in const context a panic is just a compile time error.

>>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> Se=
lf {
>>          let name =3D name.to_bytes_with_nul();
>>          let modname =3D modname.to_bytes_with_nul();
>> =20
>> +        assert!(
>> +            modname.len().saturating_add(name.len()) <=3D bindings::AUX=
ILIARY_NAME_SIZE as usize,
>> +            "auxiliary device ID is too long"
>> +        );

Isn't this missing to consider the separator and NULL terminator?

>
> We really shouldn't panic, we should error out and fail the creation
> instead.

This is only ever used from const context to construct the device ID table,=
 e.g.
as in

	kernel::auxiliary_device_table!(
	    AUX_TABLE,
	    <NovaDriver as auxiliary::Driver>::IdInfo,
	    [(
	        auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY_NAME),
	        ()
	    )]
	);

and a panic in const context makes the compilation fail, so it works as
intended.

Unfortunately, we can't enforce that is function can only be called from co=
nst
context, so technically it could also be called outside of the device ID ta=
ble
in non-const context, but it would be odd to construct outside of a device =
ID
table.

> But what is placing the constraint of the name size here?  The C api
> just takes a pointer, it doesn't care about the size, why does the rust
> binding care?

I assume you were thinking of something else? This struct represents

	#define AUXILIARY_NAME_SIZE 40
=09
	struct auxiliary_device_id {
		char name[AUXILIARY_NAME_SIZE];
		kernel_ulong_t driver_data;
	};
