Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB633030C
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325240; cv=none; b=FsLDvwxq8YArDgwxlz6WAS7HeJerx8xCIQhp3NB26iiYMMpyRE9F4XA0j6t+YmjRIsnAZTJLAe6xT0NWBoU6IOwBIhfj9BvkbvEslrzfe3DKueiB8EgY5a2YXYvIv9oIBG+Z1PtAtBGXJlYTo9DEfet4FMfxC0OExKGJEoWFL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325240; c=relaxed/simple;
	bh=zYEg72eTegIm4aBsUkMl8q2KG4rMnFZIPR9seQA5Ej8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=J4v7o7sYZEr3sTyEPoVsWmP94lhopBCdmOY8knoM5OWVpchKxXAgq2Ce6BR4WU9d+I5xsLeptxcZD4AV9yQuRtaCRxzFoalXRRT3vgXQgZ4XM9cZ2b/Zub9M5V6rIU8xoq/ciA6GCHdCiBuWswqsTWHX7tOnp/rhxizuQYtnshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0ZuDU6W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0ZuDU6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
	b=Q0ZuDU6Why2aL+sRV6jj9bhCHZ5rE/jluIhLOGGodSG22s3IH9jKGsCz79UqAJjnMssfl6
	Ojz0INf1V9QrgOKgXespGzuni/d8xmSB8iEfR2X9k/W54RTBaSEK07+Lp6xvsDV5z7dV+q
	AgfcKl9+x5VD87r+hMXC3vke6bJTq34=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-wcwSeBU7PkiPeRfgwMFOdQ-1; Thu, 05 Feb 2026 16:00:38 -0500
X-MC-Unique: wcwSeBU7PkiPeRfgwMFOdQ-1
X-Mimecast-MFC-AGG-ID: wcwSeBU7PkiPeRfgwMFOdQ_1770325238
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso240724485a.0
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325238; x=1770930038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
        b=q4DpGCBgQp3yodD1LLgbSBOsNthsJmI7G9Zdr4wZ3Yw4HYaRbAE0y0KIo01jiXz2bc
         owtnQDk6w+27A+23yrfXDlslULTMw2c1hCvLHOBFL0KIisfXGtaLdUimDmzH5uGXSdR6
         kGBppoYybc0g93HCnTU/xY4t8DrBIFUuv/5DlqtcF0JMV4/q0fV9tcUhdGLn7GnJ2ImJ
         PqXdR0VPSVy0fCPhjso570an8xEimMYopx911rjjxaddRW5EWX5Vs/Kw5Vk8YMQdPCZl
         aN5zYmuR+BbAWNsupXeS0TE3xhcTGRrAK5WmXODAa+/1TzBfaSr6c99KKhyXIOlIbNUZ
         Zj+g==
X-Forwarded-Encrypted: i=1; AJvYcCWMdHoafeZR2qwXE1R+jy6xuQoiA0I2OMpqjoRfKO75RLUFd9baGHFv2Ho85/To1iaE0+WCNL3zxw2A3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYtZBVwu9dHXlQhty6kEcFbjrySJjTfX/TdiqfYnesZnDaQvWl
	pSHjPmTld/6JrJ7FzbxsTvsynhPrBVruq/XoZmUaYknlrs5EB1BJvzr78vbpL41oqUyVc/lV5cs
	NgzxLjza6J+VPMmLA5P9sfL/zlZ9r8nqrFp+qTF4PW8D1YyAMxhasnIxb0r3jOD84
X-Gm-Gg: AZuq6aJfpYASoignVfIQQ+GeV7ZNCiyDZqNhU6tjr+BHFTdSjZuipfwvvH/nxCHxvoY
	sSqfDGgk1hLbvwN/WWvd6Z4w++HiadbwVinpqGZPLj9NaG+hCRFllYgScBnoVBWnZGwV9VCChC8
	/eS4A+wmf0oakvOycpiy7BIJfX8RPHlLxCUNqxpwChEJhDN+vZ24IrNR+Msn3lqETa4+Mm8rGvh
	Junx0ggKbuTGcUZBBv2VFccGnt20mh/QnJF6PefFOK/sInQr3cY+VZIseTroFfTtQFSWjlXZn0m
	KZZv5Z7XMVDqXC5jk6vkerSzkAzI4sPmAgM4FGDTAXpS8xBldTfCvAGP5KBvB7Hr6bWdUfiijzm
	b9uZK2x4Fq9/GtpM=
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72340385a.11.1770325237591;
        Thu, 05 Feb 2026 13:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72328985a.11.1770325236916;
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:55 -0500
Subject: [PATCH v2 08/10] rust: pci: add num_vf(), to return number of VFs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-8-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: F0-l0MwFc700GRTOFrZEz_93mtQd5d0WyCckrxYFFVI_1770325238
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.52.0

