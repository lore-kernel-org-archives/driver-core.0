Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C008332EAA
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325236; cv=none; b=D1MncMyYyCmME5p3P3PqzUM1OniaCCvnZVApw54u6idbATvXjgIWFRMTMDJ2UQqpn1DblvuqYK0EefPFL/g7LxwshF74O8KtWw+nIz66dIWleBJwjTSDn/JysuLYMK9BP2fYn+pkW47HwTqQFJTav46OwLUiKP8C1XJKYlJeOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325236; c=relaxed/simple;
	bh=mGjHnViOpaBiawwKiFLL50tHLKnItFMnpZghT+ZkbZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=IUCpSnajFvnEhyZW/bxIfc2mUctnqmpihVsqL45ZnoH2v6zFDIsL2ItAYsrmWJ0DBYfNoRzT+HPZQm+vh3YEkgh/hI2skxX74YrwuVoJVznCurfRP47TMqumjELjVMTJxZl5XlSL+C9jMkVA3vWq1X8KJfDiV8IHw5BeBcCRxbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkR6J3qx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkR6J3qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
	b=BkR6J3qxMh/xW/fYGRiRqIKN6RxaOCkv+xwYzN2Z1uTge58PmFwQHOR6Gv8v6Eym1mGTB2
	DwKN2yI8T+wj9Du0l8KIWMGNA8v8u6UAbLXPnFsBAr4Oet/zrpDofqQ+zM+TsjfBVTLqHL
	okDU7i0MmY43yoCJ93N2ENZcqs4NsTc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-ro0Z5wVTMCW3DWPf8Lqqxw-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: ro0Z5wVTMCW3DWPf8Lqqxw-1
X-Mimecast-MFC-AGG-ID: ro0Z5wVTMCW3DWPf8Lqqxw_1770325234
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so399877285a.0
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325234; x=1770930034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
        b=N8r9NapFlTNXJqTa3u68K4WA35hFy56wnpqdyV9MnmYsLsiqiMQDjb7l2F2fIsogby
         8HZ6Y6gHG3g434PKnOT83wqjq4cGIJzHLjl9+S57Ip6I7GO1j7WjS0QArgqKgVokZ0p3
         +MipEJTnqV+D/oZyiIXRmgXKy/ywYm9mpZe6sVgSuVwyHtZ9i+UPfsyhSqQ350naxPzS
         nN3cA5fxS7OaRB5G6kywVfo4FdZM1d0NdPcRERlBWVsT8SpEo7RtFWLy55U9jYR8QBGx
         vK4ye+qFsiN/diFL7L2Boc1+ny6DGqgmji1KGz7hU0bks7DoYeaQCDQdJj9SMiLItdrc
         u61A==
X-Forwarded-Encrypted: i=1; AJvYcCVmYkqeqDvT6/paAkvW+Pp9bl4vgUdgTi8+OZp1mXXoCd1Aehvuq0bfbE5tHVWhQDGqlIW7JJHHvZRdEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJyR2+aOw+MrdtiQSUcE/U9fOt04MzQt5cxDPF64z7nVSaPkR0
	ha5PnUoFepH9YLHwaT3uK7PsoNd93G4BplX1u+1VgB3RIBQOEusYkvo7qcq9ZeBhfKK2eVmGLUH
	fmf7DUBArSPbZNImS6ooPVmFfUJ8BRTlsaIe18Yx8zQwLBNWEEri3W9qich/vOUWf
X-Gm-Gg: AZuq6aLhOEikrXT/tDHu+qcNE3DgHig6uf9BXnMwkoWyU6ixFlgNrbJC+wLV2fwOsEa
	9+NPQfkE74WJjsCFKSyAR9Z3qRcZjWIopGUYvMCn9jtyOXCDMw5UB5vV8igVzYjf+bhhse/5KPH
	kK2oUM0J5427yPrRR/lP/FZM80rs55AdqZf2UT22NJiVKzGoZksfrKi916gvd3cAizgoN6ufN0E
	6GNH2KCIw1qlH+pxqcuZakdfuqbcP+xHZLzVQpFS3K7XajjymYvlcoIwoHyxuLG68CzhWIv/W7p
	kw2A+icjRHr+1+wqiMF82ePl9+JLkyCvfDp9dRXrL0eBDSDL/vmqEjB0NVDfKX+/BQnkoRqHXCw
	2bmXIC/f+ezXEmEU=
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id af79cd13be357-8caf1bc2af6mr57811985a.79.1770325232028;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id af79cd13be357-8caf1bc2af6mr57795985a.79.1770325230865;
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:52 -0500
Subject: [PATCH v2 05/10] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-5-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -GQMiyuMNa9SJu0RzJWoM7vi8roTtacwGYFNoMMMbbg_1770325234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index a4c27c674bd8bdf5e3316789d38d566e90b93fe2..88bd114970431bf8c3edef94c1d48567d895eaf6 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -83,6 +83,10 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
             (*pdrv.get()).managed_sriov = true;
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -135,6 +139,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data);
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -325,6 +343,44 @@ pub trait Driver: Send {
     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.

-- 
2.52.0

