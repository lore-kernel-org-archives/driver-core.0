Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05E332EB3
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325236; cv=none; b=CyTPdrJmIpGgqUSI6xWQGkjc7m7+vBkH8ZTt71Hz4ym12+bmxtBE/AEEjM1vaIw92ZQr89xSlSmKya8JhEmA+iD/Sfjc2h+ACIwt6RN4UsbNgvz40QkwwFsJEdGG501T9wwYN1wLJrnCppKAhcb3yxPBEv96Fb6Ez9OS5wsYYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325236; c=relaxed/simple;
	bh=goR6NT6+KiuW9XKjlJCHBNrcq9pPIxNj+WVW2jrpGs0=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=J9uRA+WjXBpmnR5bvijBbLLmh2AwQFarPWizWn3B5f8+AMZeZj+ZGxXVXmn9F8y89UtkZqwj49thff6gB8IJzkrzeMoADPtKBWuMVMwkIGTVJWKDb2pEmMVS3GwOtYm/YguQU5SlBtWJbTBvjmXskSoPgQ3Svplz1tm9GXj1hqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B838K7RV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B838K7RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
	b=B838K7RVZ3xvEyVUrLjkRi2Mv926uLlnBlH/Jc+7jGLN2q9RyTqfAOEt0Iijwy4e4UWe+/
	9A1FMzTVr3CXgWlv+YhyVsuT+/E/7MWpaLVaLcs3rIMKqYD3HWBhYz7BGsryJG8T4yAFcO
	TDiiEu0dxWIQfEmkXWXxiBMqaySVAWU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-IbPBuvdPOwOZjGTeTDcm-A-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: IbPBuvdPOwOZjGTeTDcm-A-1
X-Mimecast-MFC-AGG-ID: IbPBuvdPOwOZjGTeTDcm-A_1770325234
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89471079a13so54336d6.0
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325234; x=1770930034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
        b=XYrwiFME0CbEW10RpWrp5lWbZs0wbmpGHPbX4RZfuzQ/yTwnIqSGnsrT/2dMbyT8Y0
         8dcECig7D/IhO8rsSqm0d8k0XuP9/mN2lvgfjaXzRfy910x686asJrjac+xMCBpbDLzK
         qb0kMrASzPtYS8g3CU3XVkVji8io8wqOGIfM+vIZDAM6bDFXV8Q8B3sR1Of9t2IXnbAI
         1oIueATfFfvAU5E85evxyl5aWanDkPuK7S52NEnUgpxg7FnCY6sjR6RRjB1d6EG6+uVd
         f0yp38LAsV2KBxJ2nQT21C4wZIl4coatEyxiFnY4iEDgBWryN6zpILxmHG1xFszyyh7R
         4SiA==
X-Forwarded-Encrypted: i=1; AJvYcCVsWt9JeWImEQsAtrIXOD88+hMKu97fQc4Jg3N3fdgZMm05ho2P81W7Njts9VesCzBxIZPOddV0h/Ur9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSqeqKRoJTIq2WrhaKSS2Tp6EJj5ni86+tnr9brBS2fynuYCyw
	DSHMcGo8fzgKsntnv6SanwvkKza9rmrZPiCjsHrlrXlXtIWs7gPN9lUvolLtQZU5kZitWWwQv9Q
	XDM4VGP8UTcHQs+K1pBwszizMRou4O9WsUZrrjQYgIPr9x0KsNLCNF/1lcv9f348e
X-Gm-Gg: AZuq6aKBCssXE9plokCp/HVzfI3C7ii4/ml6cMJt8/43lrsN4KeqtYR/Baio9WB89fg
	pE3OrH58dljVqH1AwV2wVH0GnNC6emRKLPtKoV+CDIrl/12xT8Drw/WfnkEuByROQXiEfp8QNg2
	jXaefKVIDDXNLB4gmfFaBezNaODt6T4EM74hPPJ7asrvMbbsDgsmfbQVjXDLayP5M3P3WqumR/K
	6wOQXtMJGVownALmRBFTkxdBx2vE/u6H7AZk2Ubdpg6FtvtaX4bvg1tCVVer+bBlfKWJ07RXT4d
	wj2tk0dX7mdw22olh/IAxPfS9UlepELZZ9XnJqCpdwlt5fFMO+AOhKlfhuOO3kFtqwbr02ulL7x
	IqWdF5MKvCSZDAP4=
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id 6a1803df08f44-8953cd9c94fmr5942096d6.63.1770325233480;
        Thu, 05 Feb 2026 13:00:33 -0800 (PST)
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id 6a1803df08f44-8953cd9c94fmr5941106d6.63.1770325232827;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:53 -0500
Subject: [PATCH v2 06/10] rust: pci: add is_virtfn(), to check for VFs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-6-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FSjVfqLbFFAFTe9-jsbazQviMmVoIYvf8w85JF9c_Gk_1770325234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add #[inline] to is_virtfn().

This patch was originally part of the series "rust: pci: expose
is_virtfn() and reject VFs in nova-core" and modified as follows:
- Replace true -> `true` in doc comment.
- Shorten description and omit justification specific to nova-core.

Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 88bd114970431bf8c3edef94c1d48567d895eaf6..db05641186c3a42922e2b6a463de9c1b099a4673 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    #[inline]
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.52.0

