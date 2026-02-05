Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6EC330651
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325242; cv=none; b=WE80fkkQFuA5VlbjHTeCG8i5axRpZkq2qxqT3xIOAit4wwq3u3mnDW69o69jYnp8oNaOXFjHINxS7QLPVkBXysk2h11cJxt6GpVWDkhws7e/D0jj6uSifeFRKEbgnlN3FOZX8mQ+lzuHfkXERob7KSlppJ4LADXrNm1HbM0+urE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325242; c=relaxed/simple;
	bh=KLbaRgHVZXPc1lQS39X/po8u/6fvm7lynlb8kx1LgCw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=MxsWYIC62qs9OjrC0/NGzeVAiEELsuaaOSOAYqrr9ZgScsX7psvorWD+YsrsUap/Bw2GkPCTebjrvqIQaNHl2nTmagnK4oMucg5xEU1If6PbIvoN8fBTN2fQxMKqp+NC//iLVfTxGsOmFRLzahGF0GPjRvXntCv1DXKuE8P+yH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ev/HVnBk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ev/HVnBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
	b=ev/HVnBk/ZJ1zLvbIrzH9eQNsdIhPiJo8bXUXdS7XdBXJfsddQSLbmKPM6lraZs260ARvP
	s3JTcyflQ1oLFCT9uAdwX0XMuwOV2XBekSLn8GMUW/nbLnGhe3bv5DF6e9jsg+SpN2/I1i
	gh+Zp+aqxlxUNXckg6MxtjDCAtlb+6A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-31IlscXYMrqSItbl9cOu2w-1; Thu, 05 Feb 2026 16:00:40 -0500
X-MC-Unique: 31IlscXYMrqSItbl9cOu2w-1
X-Mimecast-MFC-AGG-ID: 31IlscXYMrqSItbl9cOu2w_1770325240
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a62ca32so416169985a.2
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325240; x=1770930040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
        b=lpS7Rf/kW9DfOcouTnyNmed05E3OuUJ87Dbo4dWzpdUNrY0Gh4GHk8Nb3QO3WOReev
         +NbjxnVLPg9z5gDwye97flYY9WY4V8vAkOYP/WQ4NjafCpxItP+5oOKxqdOJa9LpQFwH
         BiVCEeusNzkAdQcIBt1DpSt+jCaymJv7ep+GMZ6PRuyt55X/pj87NozEan8o+tEWInT/
         pFV/QQmCOFaWi9EKUNVoFErq8RO7LtNdsjYwIn4m98/7s/kAvDxnbxOZHMkLU+8H+l7n
         ZBGqDFIYOacoyU4+Pgqo3zBQC6LQEorSkrrJ0y5Nyc8l1kJhS2XEIiFvtfrrPfZIqwS0
         jvgw==
X-Forwarded-Encrypted: i=1; AJvYcCV5IUZSm+yyHtDzUdvzzBpb1raNJUMejKFaXV5YmRvncH5MMPx7MonOHrvKaU1syF+OdebbxiHFVC+6tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx52hrTJ9i4MwejOXEsKGzNCTYuNpd0F3kAhZG6keWY5RDXzh1Y
	jblv3jE5d4EqJQzqSqQTp+h5HdqR6E+sFEB5/bPQPqZ23MhpEnDxDAPwneOMVeownD44iVMitIZ
	jz1h70txfkxBEaKoaTXYOk2DBfGrc8VDC8SSVqv1i94k8KynXhBTwIlRX/cv9GpX3
X-Gm-Gg: AZuq6aIEPzasY1LxCh3OrAnEnVyDov9u9aAgPMMqU2yhsPIjztMUz1Z3gn5UsWjCPdj
	tFSjmB0sZKdJ7ckO8Vz5OYwtR8yiIAypf7DTWn9sNAIbb9APn6wqrHomezUQQNILtHWljFRh18K
	R/r2tB8UCfN1lqE/AP0qlCUM4KkCCzaw85hOIaTOAHIi67j6j7t6VqnZ/R3FksL4EcWRV3uhoke
	6w+tCRV1Ctdic0cCpC1wufwSWiR1XWJoSNmb83AcwseAeuTrd5MH4+hsVinxOCW3dzAs2vxuFie
	s2mLf/2ZzBkq0rFCT5Snq3fTr/Cd6gMZoUORb5iPxNSdCvq3Qk6REgclPerXaa6sv07ibtyH2Pq
	mW8n/EjW471UdbWE=
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8caf0487af1mr60630785a.19.1770325239620;
        Thu, 05 Feb 2026 13:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8caf0487af1mr60617885a.19.1770325238937;
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:56 -0500
Subject: [PATCH v2 09/10] rust: pci: add physfn(), to return PF device for
 VF device
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-9-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: oZi-j9ipDelCgUy1820KuWnhOAJBhe1KQu5sdcgEBvU_1770325240
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to return the Physical Function (PF) device for a Virtual
Function (VF) device in the bound device context.

Unlike for a PCI driver written in C, guarantee that when a VF device is
bound to a driver, the underlying PF device is bound to a driver, too,
by always setting the flag managed_sriov in the pci_driver structure.

In case SR-IOV has been enabled by a C driver that has not set the flag
managed_sriov in pci_driver, return an error from physfn().

This change depends on commit a995fe1a3aa7 ("rust: driver: drop device
private data post unbind") to also uphold the safety guarantee in case
a (broken) PF driver re-enables SR-IOV in its unbind() callback. That
commit extends the lifetime of the device private data beyond the
remove_callback() wrapper. In particular, that commit ensures that the
device private data for the PF device is still alive until after the
function pci_iov_remove() is called and forcibly re-disables SR_IOV,
which means the data can be safely accessed by VF drivers until then.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Uphold safety guarantee when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
---
 rust/kernel/pci.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 581930d0afe98ccc29d729e4d9aab75b4144e46c..3b11f73a9f2b69a02fe003b8feadd61864adc8c0 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -525,6 +525,59 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+impl Device<device::Bound> {
+    /// Returns the Physical Function (PF) device for a Virtual Function (VF) device.
+    ///
+    /// # Examples
+    ///
+    /// The following example illustrates how to obtain the private driver data of the PF device,
+    /// where `vf_pdev` is the VF device of reference type `&Device<Core>` or `&Device<Bound>`.
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci};
+    /// /// A PCI driver that binds to both the PF and its VF devices.
+    /// struct MyDriver;
+    ///
+    /// impl MyDriver {
+    ///     fn connect(vf_pdev: &pci::Device<Core>) -> Result {
+    ///         let pf_pdev = vf_pdev.physfn()?;
+    ///         let pf_drvdata = pf_pdev.as_ref().drvdata::<Self>()?;
+    ///         Ok(())
+    ///     }
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
+        if !self.is_virtfn() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct pci_dev`.
+        // `physfn` is a valid pointer to a `struct pci_dev` since `is_virtfn()` is `true`.
+        let pf_dev = unsafe { (*self.as_raw()).__bindgen_anon_1.physfn };
+
+        // SAFETY: `pf_dev` is a valid pointer to a `struct pci_dev`.
+        // `driver` is either NULL or a valid pointer to a `struct pci_driver`.
+        let pf_drv = unsafe { (*pf_dev).driver };
+        if pf_drv.is_null() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `pf_drv` is a valid pointer to a `struct pci_driver`.
+        if !unsafe { (*pf_drv).managed_sriov } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `physfn` may be cast to a `Device<device::Bound>` since the
+        // driver flag `managed_sriov` forces SR-IOV to be disabled when the
+        // PF driver is unbound, i.e., all VF devices are destroyed. This
+        // guarantees that the underlying PF device is bound to a driver
+        // when the VF device is bound to a driver, which is the case since
+        // `Device::physfn()` requires a `&Device<Bound>` reference.
+        Ok(unsafe { &*pf_dev.cast() })
+    }
+}
+
 impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {

-- 
2.52.0

