Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64F4BEE5E
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110810; cv=none; b=gav9L1YDeNZA9VY5dODzkN3ijzreNpDGFXcbFMuW8iLupmd5FWszLtIu+n/JMgvyiWVWwyfWkqOu9WXuPtF/ECl9/Natx0xSvrxABglLozRRdGoI7iZU/idj7Gs+qbor2NL/+SnfDi9WNjfm0Fnav5f5dmNF+AuYw8Kz0nQQHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110810; c=relaxed/simple;
	bh=KfBdE6t7FPnuZzUjPuds1r9e3PGeWBYgu1ZyWfWibEk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9EsIv9lbc9hjWsNFCSMoXYFZpOqMpxPllsNuALFMMRs+W6XXLmTRt0KNiDLZlZRQK0MQJPV7jEp2GWol0ORfLR/5QlGGoJr1HKZU/Zq+i1eMTHELu05N/2iDkVYbrESHcyWfhfPshZl7mBKn4JB+sWidzo2bPq+dJEOifBmA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net; spf=pass smtp.mailfrom=kaehlcke.net; dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b=B69BsV0n; arc=none smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b="B69BsV0n"
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8FE2E8C3360;
	Tue, 22 Sep 2026 20:23:12 +0000 (UTC)
Received: from pdx1-sub0-mail-a243.dreamhost.com (100-99-162-101.trex-nlb.outbound.svc.cluster.local [100.99.162.101])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4E96C8C30C5;
	Tue, 22 Sep 2026 20:23:12 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|matthias@kaehlcke.net
X-MailChannels-Auth-Id: dreamhost
X-Share-Inform: 627f490d7ea5f0bd_1790108592430_3881385717
X-MC-Loop-Signature: 1790108592430:3447525529
X-MC-Ingress-Time: 1790108592430
Received: from pdx1-sub0-mail-a243.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.162.101 (trex/8.0.2);
	Tue, 22 Sep 2026 20:23:12 +0000
Received: from bielski.sytes.net (unknown [79.117.203.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: matthias@kaehlcke.net)
	by pdx1-sub0-mail-a243.dreamhost.com (Postfix) with ESMTPSA id 4hqBPC6XkPz105h;
	Tue, 22 Sep 2026 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaehlcke.net;
	s=dreamhost; t=1790108592;
	bh=9WxhL77RDJwBHr8SB5zwWSYMVxhQysRUO1B8XQCVkxk=;
	h=Date:From:To:Subject:Content-Type;
	b=B69BsV0nu72p++psYT0f6XCU/CPZaAW1m4qM57gA6Rwok88dCeaP6yaIraQ0N7D8+
	 V+g4+EsQKhibAt09kd2o9EqRLtLBGRWnzdq0obMjb0jrgMXOcl5kzARY41zOD9Bzly
	 2RZVIX84M4TgXBcljh7M9bVGIQHcyGUwfHk3B4nuWgiqKlFVTWQy//WCGUlcRpIiVs
	 B59P9EHHCJElD4Qf8nbimX5VTkltiJUa7KTdpJquZ8RTIWEX2ucUcJ2IAFQ/MBD5jH
	 m2TMgkCsGLtfmM3LNia4Eaket87couedrwVzJ++GTyHBG7CoMNjC3C6qVKNEOIP6TM
	 +2ZzY/0EknkGw==
Received: by bielski.sytes.net (Postfix, from userid 1000)
	id 871B680E1C; Tue, 22 Sep 2026 13:23:09 -0700 (PDT)
Date: Tue, 22 Sep 2026 22:23:09 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: debugfs: add primitive type bindings
Message-ID: <20260922202309.fwdfx4vskalq7grs@bielski>
Mail-Followup-To: Matthias Kaehlcke <matthias@kaehlcke.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9306c51f937e4bb4026e68d862b64b16f6894282.1790103860.git.matthias@kaehlcke.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9306c51f937e4bb4026e68d862b64b16f6894282.1790103860.git.matthias@kaehlcke.net>

sashiko-bot@kernel.org pointed out a few issues that seem valid,
I'll try to address these first before human reviewer time is
needed.

El Tue, Sep 22, 2026 at 09:18:58PM +0200 Matthias Kaehlcke ha dit:

> Introduce `impl_debugfs_primitive!` to implement debugfs attribute
> creation for native Rust primitive types by wrapping C debugfs creation
> helpers.
> 
> Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> ---
>  rust/kernel/debugfs.rs       | 52 +++++++++++++++++++++
>  samples/rust/rust_debugfs.rs | 91 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 143 insertions(+)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index d7b8014a6474..bec600c67a06 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -400,6 +400,58 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
>      }
>  }
>  
> +/// Implements `debugfs` interface operations for a single primitive type.
> +///
> +/// This macro generates the necessary FFI wrappers and glue code to expose
> +/// a specific primitive type (e.g., `u32`, `bool`) to the `debugfs` filesystem.
> +///
> +/// # Type Support
> +///
> +/// Accepts standard integer primitives (`u8` through `u64`, `x8` through `x64`),
> +/// `bool`, and `usize`.
> +///
> +/// # Examples
> +///
> +/// ```rust,ignore
> +/// impl_debugfs_primitive!(u32, create_u32, debugfs_create_u32);
> +/// ```
> +macro_rules! impl_debugfs_primitive {
> +    ($type:ty, $fn_name:ident,$c_func:ident) => {
> +        impl Dir {
> +            /// Creates a debugfs entry for a primitive `$type` value inside this directory.
> +            ///
> +            /// # Safety
> +            ///
> +            /// `value` must point to a valid memory location that outlives this directory `Dir`
> +            /// (e.g., inside a pinned driver state structure or a `static` location).
> +            pub unsafe fn $fn_name(&self, name: &CStr, mode: u16, value: *mut $type) {
> +                let parent_ptr = match self.0.as_deref() {
> +                    Some(entry) => entry.as_ptr(),
> +                    None => core::ptr::null_mut(),
> +                };
> +
> +                // SAFETY: `name` is a valid CStr. `parent_ptr` points to a valid parent
> +                // dentry or NULL. The caller guarantees that `value` outlives the debugfs node.
> +                unsafe {
> +                    bindings::$c_func(name.as_char_ptr(), mode, parent_ptr, value);
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +// Bind native Rust primitive types to their corresponding C debugfs helpers.
> +impl_debugfs_primitive!(u8, create_u8, debugfs_create_u8);
> +impl_debugfs_primitive!(u16, create_u16, debugfs_create_u16);
> +impl_debugfs_primitive!(u32, create_u32, debugfs_create_u32);
> +impl_debugfs_primitive!(u64, create_u64, debugfs_create_u64);
> +impl_debugfs_primitive!(u8, create_x8, debugfs_create_x8);
> +impl_debugfs_primitive!(u16, create_x16, debugfs_create_x16);
> +impl_debugfs_primitive!(u32, create_x32, debugfs_create_x32);
> +impl_debugfs_primitive!(u64, create_x64, debugfs_create_x64);
> +impl_debugfs_primitive!(bool, create_bool, debugfs_create_bool);
> +impl_debugfs_primitive!(usize, create_size_t, debugfs_create_size_t);
> +
>  #[pin_data]
>  /// Handle to a DebugFS scope, which ensures that attached `data` will outlive the DebugFS entry
>  /// without moving.
> diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
> index 77c19a437695..b2ef8c71f7ee 100644
> --- a/samples/rust/rust_debugfs.rs
> +++ b/samples/rust/rust_debugfs.rs
> @@ -34,6 +34,7 @@
>  use core::str::FromStr;
>  use kernel::{
>      acpi,
> +    c_str,
>      debugfs::{
>          Dir,
>          File, //
> @@ -79,6 +80,8 @@ struct RustDebugFs {
>      array_blob: File<Mutex<[u8; 4]>>,
>      #[pin]
>      vector_blob: File<Mutex<KVec<u8>>>,
> +    #[pin]
> +    primitive_values: PrimitiveValues,
>  }
>  
>  #[derive(Debug)]
> @@ -87,6 +90,36 @@ struct Inner {
>      y: u32,
>  }
>  
> +struct PrimitiveValues {
> +    u8: u8,
> +    u16: u16,
> +    u32: u32,
> +    u64: u64,
> +    x8: u8,
> +    x16: u16,
> +    x32: u32,
> +    x64: u64,
> +    size_t: usize,
> +    bool: bool,
> +}
> +
> +impl PrimitiveValues {
> +    fn new() -> Self {
> +        Self {
> +            u8: 8,
> +            u16: 16,
> +            u32: 32,
> +            u64: 64,
> +            x8: 0x88,
> +            x16: 0x1616,
> +            x32: 0x32323232,
> +            x64: 0x6464646464646464,
> +            size_t: 12345678,
> +            bool: true,
> +        }
> +    }
> +}
> +
>  impl FromStr for Inner {
>      type Err = Error;
>      fn from_str(s: &str) -> Result<Self> {
> @@ -171,9 +204,67 @@ fn new<'a, 'b>(
>                      c"vector_blob",
>                      new_mutex!(kernel::kvec!(0x42; SZ_4K)?),
>                  ),
> +                primitive_values <- PrimitiveValues::new(),
>                  _debugfs: debugfs,
>                  pdev: pdev.into(),
>              }
>          }
> +        .pin_chain(|this| {
> +            // SAFETY: primitive values live until the module is dropped
> +            unsafe {
> +                this._debugfs.create_u8(
> +                    c_str!("u8"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.u8) as *mut _,
> +                );
> +                this._debugfs.create_u16(
> +                    c_str!("u16"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.u16) as *mut _,
> +                );
> +                this._debugfs.create_u32(
> +                    c_str!("u32"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.u32) as *mut _,
> +                );
> +                this._debugfs.create_u64(
> +                    c_str!("u64"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.u64) as *mut _,
> +                );
> +                this._debugfs.create_x8(
> +                    c_str!("x8"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.x8) as *mut _,
> +                );
> +                this._debugfs.create_x16(
> +                    c_str!("x16"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.x16) as *mut _,
> +                );
> +                this._debugfs.create_x32(
> +                    c_str!("x32"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.x32) as *mut _,
> +                );
> +                this._debugfs.create_x64(
> +                    c_str!("x64"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.x64) as *mut _,
> +                );
> +                this._debugfs.create_bool(
> +                    c_str!("bool"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.bool) as *mut _,
> +                );
> +                this._debugfs.create_size_t(
> +                    c_str!("usize"),
> +                    0644,
> +                    core::ptr::addr_of!(this.primitive_values.size_t) as *mut _,
> +                );
> +            }
> +
> +            Ok(())
> +        })
>      }
>  }
> -- 
> 2.47.3
