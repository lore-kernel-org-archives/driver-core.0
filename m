Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4930942BC40
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441367; cv=none; b=uGg0qyi00vnXdINbJSSvBWhTLpG+WR3JR5knyTsD8RzwxvvGwFmDbAyoAsIokXqSpYlI53fzITGSgycHxpctlUgSMvHTvy7QWvNwbEJ2N723V4HatPpZiF6+D2n6M7vsF/APxYnnp3hEM9JpqDCNnfYZ7TNhwZWAGLkNiSBSZU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441367; c=relaxed/simple;
	bh=95yY9cjA4oVPmXAFuCH3xualr4XOSa23Dn+LBb2Yodg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdKwLgQZj8wZvlDzgS0lOKgQOXsfOhZ7oQ3MDXdLAMuFkwv0oK8iBA+7yguL+94a93fwX0d/yhJT53UMSh9DIKU8DF6Lrt2cAmRxgZZxLSoDHDu67fcwSw5ULnhUCiP3hNTrFzBfsC37wAOFl6jh8+4VqpqKHr3Iml8JkRNL8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=SgezdFc2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="SgezdFc2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1421784f8f.2
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1786441362; x=1787046162; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2iRWi2TN8f6wY1UpWFyKTBNPNL1D5PfKvHtZR9X5kU=;
        b=SgezdFc20fySFQqijyXDstu5eYA/POlhky6Ukkt9mF7DkRN88v3GECK/BzzJrFxg3N
         aU+VSHrqFKo3HLqVZRKzut2vmlWrrsR68YAsh9VNWD9uvtspfNbtCNdbqFUFRqf3Z5Qr
         H9RdJqlpXKNYGEnFZsLRAqTdql4PqKSKLtD+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441362; x=1787046162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2iRWi2TN8f6wY1UpWFyKTBNPNL1D5PfKvHtZR9X5kU=;
        b=KtVHLYQH/gGSd1RaEJN6rGA9nTiS4J+K5cGF7cVO85hD0VMlNpcGpeiGMd4wlgauo3
         4zIVin1oy3knvy57G2do8DDwUMHDEvS86KquBnqIte61Rl15bQqk9pQDFsluTxTKqp1R
         8ZDt9/wQTBiEy6UaKMnmgYBNub9nh58+vs/2ReOrUjf8KHgFeob8CuvnZVRgCqgU/7JC
         aZrXYRGJV2Hf4sqodu7O6UKA4zE9KtCBDgwkLfkZe4aWtFR56/NKOSOU6CDTCLjjr/4+
         AIWnbzh+r+BbM9M6YY0a23RlOAs0z1nvlEKe3y+odhU6/TkmjgVt6CoVrCTmJneaVr51
         G/1A==
X-Forwarded-Encrypted: i=1; AHgh+RpCJ3Uf9ZpkrtBfJWENCB9s90V+cNQaQ2+xA0JXEipwJ4jQ06On4BxF5ZSvVIHMbBMkPziVJPjBECsRwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLGoR7Bkmd0DkVRqjBA7zkF6GnDP82jgv9VxJxE4h37yQxXIr/
	CJDQYgISLUbepMfjIY9pMqHnywKLQoCmlI0pqCt7jX8ZVG1I/VJIuwezsK6enZOnZaU=
X-Gm-Gg: AR+sD11SRrZa0qljGnJU4yXVnKHzdkUcp7sR7CWXODelDL05/lxdjarupRwufdET4mh
	+kOjXGB3ep5SInebocS7r8f/l8gS52oqVj0g2lMbx3/hcS6J5WiCfmOTpAjwn4wCZeYNCp8C2Xa
	Y60u5788NANNeBa0EqaXHl9pm4kyRvLKmiPVYNMqKgZ+m4Lc4j+oVNAt9bx5S3va0yodJuVSNTo
	uN2bMCqKzU9/y7td1SGIGsF2+WL++K3O01vugkcmj++Q791tI30cnw1W1HSzSmRUqZElUz3SUAx
	IJbmRq+ElF/ZqGEf3g5pwOVY/yeCZNAQZbde9vm6B6PbJnC7uZTqsH4SuUujGpicaglrn9TfT4J
	k6kWoKtMRSsKNWjN2RO1GZR51UnX2J+3IS+KtcNqdXyr77QY8eUrDMmuIX1q+wk0J2iOf9vb5M8
	+s2Qqeswo23ToxRzZeKwA9p4x53rbyMHnB//+CGBV7o5h6mGEfd9skAQoh9fOTOPbjRWNSxIoz2
	TG2HdAIHkI5ZAsxuFz7DIWGSJjbvaECs3/9fA==
X-Received: by 2002:a05:6000:240c:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-4814aee3ef2mr2770871f8f.29.1786441362473;
        Tue, 11 Aug 2026 02:42:42 -0700 (PDT)
Received: from [10.0.36.57] ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709624sm3388917f8f.22.2026.08.11.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:41 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Date: Tue, 11 Aug 2026 12:42:29 +0300
Subject: [PATCH RFC v2 2/4] rust: usb: add control message send and receive
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-rust-usb_control_msg-v2-2-ef79c92bd898@wyliodrin.com>
References: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
In-Reply-To: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

Add `Device::control_message_send()` and
`Device::control_message_receive()`, wrapping usb_control_msg_send()
and usb_control_msg_recv(), plus a `Request` type describing the
bmRequestType, bRequest, wValue and wIndex fields of a setup packet.

`Request` deliberately omits the two setup packet fields that are
properties of a submission rather than of the request itself: the
direction bit of bmRequestType and wLength. Both are derived from the
method called and the buffer passed, so a caller cannot describe an
inbound transfer while handing over a read-only buffer, nor set a
length that disagrees with one.

Both methods take a `&HostEndpoint<Bidirectional, Control>`, so a
non-control endpoint cannot be passed by construction.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
 rust/kernel/usb.rs         |   1 +
 rust/kernel/usb/control.rs | 367 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 368 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 4f5f1db3e7ca..6670fa2ff377 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -33,6 +33,7 @@
     slice, //
 };
 
+pub mod control;
 pub mod endpoint;
 
 /// An adapter for the registration of USB drivers.
diff --git a/rust/kernel/usb/control.rs b/rust/kernel/usb/control.rs
new file mode 100644
index 000000000000..b9fafb31d479
--- /dev/null
+++ b/rust/kernel/usb/control.rs
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (C) 2026 Wyliodrin SRL.
+
+//! USB control transfers.
+//!
+//! Control transfers are the request/response mechanism every USB device must support. A transfer
+//! consists of an 8-byte setup packet, an optional data stage, and a status stage;
+//! the setup packet is described by [`Request`], and the direction of the data stage is chosen by
+//! calling either [`Device::control_message_send()`] or [`Device::control_message_receive()`].
+//!
+//! Both travel over a control endpoint - usually the device's default one, from
+//! [`Device::control_endpoint()`]. Because control endpoints are bidirectional, the endpoint does
+//! not determine the direction: the `Direction` bit of `bmRequestType` does, and these two methods
+//! set it so it cannot disagree with the buffer you passed.
+
+use core::{ptr, time::Duration};
+
+use ffi::c_void;
+
+use crate::{
+    alloc::Flags,
+    bindings,
+    error::{
+        code::{
+            EINVAL,
+            EOVERFLOW, //
+        },
+        Error,
+        Result, //
+    },
+    num::Bounded,
+    usb::{
+        endpoint::{
+            Bidirectional,
+            Control,
+            Direction,
+            HostEndpoint, //
+        },
+        Device,
+    },
+};
+
+/// Position of the `Type` field within `bmRequestType` (bits 6:5).
+const REQUEST_TYPE_SHIFT: u32 = 5;
+
+/// Which part of the USB specification defines the meaning of a [`Request`].
+///
+/// This is the `Type` field of `bmRequestType`, occupying bits 6:5 of the setup packet's first
+/// byte. It selects the namespace that [`Request::request`] is interpreted in, so the same request
+/// code means different things under different types.
+#[derive(Copy, Clone, PartialEq, PartialOrd)]
+#[repr(u8)]
+pub enum RequestType {
+    /// Request is a USB standard request, defined by the specification itself and interpreted the
+    /// same way by every device. Usually handled by the USB core rather than by a driver; see
+    /// [`Device`].
+    Standard = 0,
+    /// Request is intended for a USB class.
+    Class = 1,
+    /// Request is vendor-specific.
+    Vendor = 2,
+    /// Reserved.
+    Reserved = 3,
+}
+
+/// The target a [`Request`] is addressed to.
+///
+/// This is the `Recipient` field of `bmRequestType`, occupying bits 4:0 of the setup
+/// packet's first byte. For [`INTERFACE`](Self::INTERFACE) and [`ENDPOINT`](Self::ENDPOINT)
+/// the specific interface or endpoint is named by [`Request::index`]; the other recipients
+/// ignore it or give it a request-specific meaning.
+///
+/// Although the field is five bits wide, only the values below are defined - hence
+/// the bound on the wrapped [`Bounded`].
+#[derive(Copy, Clone, PartialEq, PartialOrd)]
+#[repr(transparent)]
+pub struct Recipient(Bounded<u8, 5>);
+
+impl Recipient {
+    /// The device as a whole.
+    pub const DEVICE: Self = Self(Bounded::<u8, 5>::new::<0u8>());
+    /// A specific interface, named by [`Request::index`].
+    pub const INTERFACE: Self = Self(Bounded::<u8, 5>::new::<1u8>());
+    /// A specific endpoint, named by [`Request::index`].
+    pub const ENDPOINT: Self = Self(Bounded::<u8, 5>::new::<2u8>());
+    /// Some other target, defined by the request itself.
+    pub const OTHER: Self = Self(Bounded::<u8, 5>::new::<3u8>());
+    /// A port. Wireless USB only.
+    pub const PORT: Self = Self(Bounded::<u8, 5>::new::<4u8>());
+    /// An RPipe. Wireless USB only.
+    pub const RPIPE: Self = Self(Bounded::<u8, 5>::new::<5u8>());
+
+    /// Builds a recipient from a raw field value.
+    ///
+    /// Prefer the associated constants; this exists for values a future specification revision may
+    /// define. The [`Bounded`] parameter rules out values the field cannot hold, but does not
+    /// guarantee the device understands the one you pass.
+    pub fn new(val: Bounded<u8, 5>) -> Recipient {
+        Recipient(val)
+    }
+}
+
+/// The setup packet of a control transfer, minus the direction and length.
+///
+/// These fields map onto the setup packet as `bmRequestType` (from
+/// [`request_type`](Self::request_type) and [`recipient`](Self::recipient)), `bRequest`, `wValue`
+/// and `wIndex`. The remaining two - the `Direction` bit of `bmRequestType` and `wLength` - are
+/// filled in by [`Device::control_message_send()`] and [`Device::control_message_receive()`] from
+/// the method you call and the buffer you hand it, which is what keeps them consistent with each
+/// other.
+pub struct Request {
+    /// Type of the request.
+    pub request_type: RequestType,
+    /// Recipient of the request.
+    pub recipient: Recipient,
+    /// Request code. The meaning of the value depends on the previous fields.
+    pub request: u8,
+    /// Request value. The meaning of the value depends on the previous fields.
+    pub value: u16,
+    /// Request index. The meaning of the value depends on the previous fields.
+    pub index: u16,
+}
+
+impl Request {
+    /// Encodes this request into a `bmRequestType` byte for a data stage flowing in `direction`.
+    ///
+    /// `direction` here is a property of the transfer, not of the endpoint it runs over: bit 7 of
+    /// `bmRequestType` is what the host controller obeys for a control transfer, and bit 7 of the
+    /// endpoint address is defined to be ignored.
+    fn bm_request_type(&self, direction: Direction) -> u8 {
+        let dir = match direction {
+            // `USB_DIR_IN` is `0x80`; `USB_DIR_OUT` is zero.
+            Direction::In => bindings::USB_DIR_IN as u8,
+            Direction::Out => 0,
+        };
+
+        dir | ((self.request_type as u8) << REQUEST_TYPE_SHIFT) | self.recipient.0.get()
+    }
+}
+
+/// Converts a buffer length into a `wLength` value.
+///
+/// The field is 16 bits, so anything larger cannot be expressed in a single control transfer.
+#[inline]
+fn transfer_length(len: usize) -> Result<u16> {
+    u16::try_from(len).map_err(|_| EOVERFLOW)
+}
+
+impl Device {
+    /// Performs a control transfer with an outbound data stage, i.e. host to device.
+    ///
+    /// The `Direction` bit of `bmRequestType` is set to `USB_DIR_OUT` for you. Pass [`None`] as
+    /// `data` for a request with no data stage at all, which sets `wLength` to zero.
+    ///
+    /// `endpoint` selects the control endpoint to use; it must belong to this device, since only
+    /// its [`number()`](Endpoint::number) is taken from it. For the default control endpoint -
+    /// almost always the right choice - pass [`control_endpoint()`](Device::control_endpoint).
+    ///
+    /// `timeout` with zero meaning `USB_MAX_SYNCHRONOUS_TIMEOUT` of 60s.
+    ///
+    /// `memflags` are used for an
+    /// internal copy of `data`, so `data` itself need not be DMA-capable.
+    ///
+    /// Returns `Ok(())` only if the whole request completed; unlike `usb_control_msg()` there
+    /// is no partial-success case to inspect.
+    ///
+    /// This sleeps, so it must not be called from atomic context.
+    ///
+    /// # Examples
+    ///
+    /// A vendor-specific request with no data stage:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn set_led(dev: &Device, on: bool) -> Result {
+    ///     dev.control_message_send(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Vendor,
+    ///             recipient: Recipient::DEVICE,
+    ///             request: 0x01,
+    ///             value: on as u16,
+    ///             index: 0,
+    ///         },
+    ///         None,
+    ///         1000,
+    ///         GFP_KERNEL,
+    ///     )
+    /// }
+    /// ```
+    ///
+    /// A class request that carries a payload:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn set_line_coding(dev: &Device, interface: u8, coding: &[u8; 7]) -> Result {
+    ///     dev.control_message_send(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Class,
+    ///             recipient: Recipient::INTERFACE,
+    ///             request: 0x20,
+    ///             value: 0,
+    ///             index: interface as u16,
+    ///         },
+    ///         Duration::from_millis(1000),
+    ///         1000,
+    ///         GFP_KERNEL,
+    ///     )
+    /// }
+    /// ```
+    pub fn control_message_send(
+        &self,
+        endpoint: &HostEndpoint<Bidirectional, Control>,
+        request: Request,
+        data: Option<&[u8]>,
+        timeout: Duration,
+        memflags: Flags,
+    ) -> Result {
+        let (data, size) = match data {
+            Some(bytes) => (
+                bytes.as_ptr().cast::<c_void>(),
+                transfer_length(bytes.len())?,
+            ),
+            None => (ptr::null(), 0),
+        };
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariants of
+        // [`Device`], and `endpoint` belongs to it, so its number names a control endpoint of this
+        // device. `data` is either null with `size` zero, or points at `size` initialised bytes
+        // that outlive the call - the callee only reads from it, and copies before submitting, so
+        // no DMA is performed on the caller's buffer.
+        let ret = unsafe {
+            bindings::usb_control_msg_send(
+                self.as_raw(),
+                endpoint.number(),
+                request.request,
+                request.bm_request_type(Direction::Out),
+                request.value,
+                request.index,
+                data,
+                size,
+                timeout.as_millis().try_into().map_err(|_| EINVAL)?,
+                memflags.as_raw(),
+            )
+        };
+
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Performs a control transfer with an inbound data stage, i.e. device to host.
+    ///
+    /// The `Direction` bit of `bmRequestType` is set to `USB_DIR_IN` for you. Pass [`None`] as
+    /// `data` for a request with no data stage at all, which sets `wLength` to zero - note that
+    /// this makes the direction bit meaningless, so such a request is indistinguishable from the
+    /// [`control_message_send()`](Device::control_message_send) equivalent.
+    ///
+    /// `endpoint` selects the control endpoint to use; it must belong to this device, since only
+    /// its [`number()`](Endpoint::number) is taken from it. For the default control endpoint -
+    /// almost always the right choice - pass [`control_endpoint()`](Device::control_endpoint).
+    ///
+    /// `timeout` with zero meaning `USB_MAX_SYNCHRONOUS_TIMEOUT` of 60s.
+    ///
+    /// `memflags` are used for an
+    /// internal DMA-capable buffer that is copied into `data` on success, so `data`
+    /// itself need not be DMA-capable.
+    ///
+    /// The transfer must fill `data` exactly. A device that returns fewer bytes than requested
+    /// fails with `EREMOTEIO` and leaves `data` untouched, so this is not the right method for
+    /// requests of variable-length descriptors - size the buffer from the device's own length
+    /// field, or use a lower-level transfer.
+    ///
+    /// This sleeps, so it must not be called from atomic context.
+    ///
+    /// # Examples
+    ///
+    /// Reading a fixed-size vendor-specific register:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn firmware_version(dev: &Device) -> Result<u16> {
+    ///     let mut buf = [0u8; 2];
+    ///
+    ///     dev.control_message_receive(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Vendor,
+    ///             recipient: Recipient::DEVICE,
+    ///             request: 0x02,
+    ///             value: 0,
+    ///             index: 0,
+    ///         },
+    ///         &mut buf,
+    ///         Duration::from_millis(1000),
+    ///         GFP_KERNEL,
+    ///     )?;
+    ///
+    ///     Ok(u16::from_le_bytes(buf))
+    /// }
+    /// ```
+    pub fn control_message_receive(
+        &self,
+        endpoint: &HostEndpoint<Bidirectional, Control>,
+        request: Request,
+        data: &mut [u8],
+        timeout: Duration,
+        memflags: Flags,
+    ) -> Result {
+        let (data, size) = {
+            let size = transfer_length(data.len())?;
+            (data.as_mut_ptr().cast::<c_void>(), size)
+        };
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariants of
+        // [`Device`], and `endpoint` belongs to it, so its number names a control endpoint of this
+        // device. `data` is either null with `size` zero, or points at `size` bytes of a buffer
+        // uniquely borrowed for the duration of the call, which the callee may only write to.
+        let ret = unsafe {
+            bindings::usb_control_msg_recv(
+                self.as_raw(),
+                endpoint.number(),
+                request.request,
+                request.bm_request_type(Direction::In),
+                request.value,
+                request.index,
+                data,
+                size,
+                timeout.as_millis().try_into().map_err(|_| EINVAL)?,
+                memflags.as_raw(),
+            )
+        };
+
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+}

-- 
2.55.0

