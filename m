Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5757EDB6;
	Wed,  9 Sep 2026 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960794; cv=none; b=a4RLDOLvWJR9+eNUXL/EcmZmazqtMv8/1vaETowg4Urn6vD4Wstmg0ASxs3RbVaaAg6JIFnS0m3FJ4EqkhdhJMAHA6j2pwJuqX0C27A0V9vg2d6YMXOFkuiQ2MvJpK3Xbx5bBtBIkKIeJul4vyiLp0XIz/jnxADPuPW2xxNjQmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960794; c=relaxed/simple;
	bh=ECzlX/oX/S1GTHCvlnS29r0wQYw6dI6ziqFK9LTI2vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyPQAoVRuGiYF1g1kuHQPZXN15A2G84SrJXy7jvEu5pdVD5Ady/TtKlvBF2OJlgmNiiPJNxn2e/aeuzWOV5hD5oEwilvvnpNdf0UDlwj02MVqfarqL0JAF0mFW6nU27rT7AITkrEdxldzQUaO/GiTLxdt3NHx+j9gOhkhwklw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uUknSbOc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uUknSbOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198261F00ACA;
	Wed,  9 Sep 2026 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788960791;
	bh=icXJZ9a4JSwSweEmeSox0X5Mce1QV9rcy07r3TyafwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uUknSbOcra+qApI0rMx+VSHxWVOfsCMaXrU7GO5aRwAX1l3M8wfqKAbLCu1eoPpQB
	 IUDgJyIdiMJCrxhUwo4njSFauD9HMGr4c4btO1I7yoCxxHffvgJN6z99sLXBnNANVy
	 zKv+4xyyqOBBJI843RoOshVCD4e4Rdz+aiehR968=
Date: Wed, 9 Sep 2026 15:33:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
Message-ID: <2026090941-salami-engraved-8eac@gregkh>
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh>
 <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLAR1FIFL0Y5.22A7AJKNW0YQP@kernel.org>

On Wed, Sep 09, 2026 at 01:29:18PM +0200, Danilo Krummrich wrote:
> On Wed Sep 9, 2026 at 9:19 AM CEST, Greg Kroah-Hartman wrote:
> > On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrote:
> >> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> >> `auxiliary_device_id::name` array without checking that they fit. An
> >> oversized name is caught by the array bounds check, but the error
> >> reports an out-of-bounds index in the copy loop rather than the
> >> constraint the caller violated.
> >> 
> >> Check the invariant explicitly instead, so the failure states the length
> >> limit rather than an array index.
> >> 
> >> In a constant context exceeding the limit leads to a build error; at
> >> runtime it panics, so add a `# Panics` section for it.
> >> 
> >> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abstractions")
> 
> It's not actually fixing a bug, so I don't think this needs a Fixes: tag.
> 
> >> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >> ---
> >>  rust/kernel/auxiliary.rs | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >> 
> >> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> >> index 60dfbec8f330..1f3ba86d6d96 100644
> >> --- a/rust/kernel/auxiliary.rs
> >> +++ b/rust/kernel/auxiliary.rs
> >> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
> >>  
> >>  impl DeviceId {
> >>      /// Create a new [`DeviceId`] from name.
> >> +    ///
> >> +    /// # Panics
> >> +    ///
> >> +    /// Panics if the combined module and device name, including the
> >> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes.
> 
> I'd rather document that this is only intended to be called within device ID
> table creation; in const context a panic is just a compile time error.
> 
> >>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
> >>          let name = name.to_bytes_with_nul();
> >>          let modname = modname.to_bytes_with_nul();
> >>  
> >> +        assert!(
> >> +            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
> >> +            "auxiliary device ID is too long"
> >> +        );
> 
> Isn't this missing to consider the separator and NULL terminator?
> 
> >
> > We really shouldn't panic, we should error out and fail the creation
> > instead.
> 
> This is only ever used from const context to construct the device ID table, e.g.
> as in
> 
> 	kernel::auxiliary_device_table!(
> 	    AUX_TABLE,
> 	    <NovaDriver as auxiliary::Driver>::IdInfo,
> 	    [(
> 	        auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY_NAME),
> 	        ()
> 	    )]
> 	);
> 
> and a panic in const context makes the compilation fail, so it works as
> intended.
> 
> Unfortunately, we can't enforce that is function can only be called from const
> context, so technically it could also be called outside of the device ID table
> in non-const context, but it would be odd to construct outside of a device ID
> table.
> 
> > But what is placing the constraint of the name size here?  The C api
> > just takes a pointer, it doesn't care about the size, why does the rust
> > binding care?
> 
> I assume you were thinking of something else? This struct represents
> 
> 	#define AUXILIARY_NAME_SIZE 40
> 	
> 	struct auxiliary_device_id {
> 		char name[AUXILIARY_NAME_SIZE];
> 		kernel_ulong_t driver_data;
> 	};
> 

Ah, sorry, I was looking at auxiliary_device_create() which just takes a
pointer to a name, which is not the device_id, but the name by which the
device_id gets created from, my bad.

greg k-h
