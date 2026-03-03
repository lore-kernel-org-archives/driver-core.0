Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405024ADDA2
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572556; cv=none; b=aVUIWJZ++E0iia2VtHFwu/5gZKTjKwdpdybDnx71tvfFyOZIp5jMSIGgwAJ7g2YJUk3as2b0f45lqpyzGI8e2FioYridAPKtUgqgaK2zFqBNmFHv8X1EDAxnujGxBLZAQOdKJhXhaMtN36yGi9Tm0wZgRWnwDsvPU7R3fQqO8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572556; c=relaxed/simple;
	bh=njU3I9YW/zDKjP+0RxMLdIuH1MmdjiC7YPBjwAwiJ4w=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=KS82OreP+uj29gepcJ2Km2Aib/NNCj4BeZwVo/1jezMd1DPWbEy0673qt7bXDsuvQkzLHb4bWNXjViKvzeb3b8x0yVHIOip6Jyi6AmnUMYwE9JThWduwGFZardHewuHVG10gBYI12Il28hHByhMrKYbbaSdp5CDoVCL5QjLzM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijnUX58E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijnUX58E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
	b=ijnUX58Ee48LjLi9TG3GeE0FS1J0thbOmOmRi+xBoVevuCv9cI9ERMOsOcoMCRZZnLhmpt
	E7TRmSKFPrK60+5PNp/NabU1Aw1+pidWQUKqmFaJnWev7GM7e+UY603xOJCi1epy0q6FKy
	goAp1UCcCEW3fAMvILGLBxC9F2YIwCQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-eopZDMaJOqicbqWDLcd2RA-1; Tue, 03 Mar 2026 16:15:50 -0500
X-MC-Unique: eopZDMaJOqicbqWDLcd2RA-1
X-Mimecast-MFC-AGG-ID: eopZDMaJOqicbqWDLcd2RA_1772572550
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503915b0a88so661323341cf.1
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 13:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572550; x=1773177350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
        b=pBBBuiTb9dVfoP8kFfQ40zEoqSK/MfnZPXqJu49h5jYO8BQN1rKJw1rDtBjqin48Jn
         BNquByBRo8nPUf2Ujp0Rp0XXNHJcV4c+NSG4bkreomPcnrp4++eF0auxhpydCoAQfzGZ
         kOnh93UxxOOvJdCAgiLlwN2GhV+JElAQ9cCr5b/PIzRY7V1BMTGodAawnVdoFRZLXjl7
         kyH5Qh3nwNtOc3EXaRu5mI6euZRc7HBNemeR4vELPmAajGk46FviwVxaHdKEpOl1lZvR
         BrpUNOFN2Ti9qBPKxOx4vRKH9DZQnjAwgWPaDW5krnn+RhjnsfdEu/t4PP5qIAQDCm+/
         DEzw==
X-Forwarded-Encrypted: i=1; AJvYcCUDn1tOxNdfthFFKtGWraUOBlT34pzrz/U4DOCXUdTnKoUILTk3xArJCYHcfMFy+/u/Ao8RZrgeHVY3Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyThEgkoV1uQHRk5bw519s0x9MbAZudVEhChP/i4hP7YVAVYi0k
	ZJ0J78fgjXvUj77HJWvI5+Yo90X16P8buYm74C6QM0kGOL7PS2GiBPKA338pxq9zi02SuslSSgI
	QnhrmmhQLvkPjJQzt7YocZ0cf8iPNhvSOI+Jjn3yqu/sVfW78SvpQwoMNDSq+pePS
X-Gm-Gg: ATEYQzxKxTPcDDiyyNukGlRGfb/rFO9liGLsIzXaVnKfmzTMoBQBFBvqcfaY747hCRC
	UuBjsjclnWSzsCI87xqS2uXNMyoONRGiJAIEcTgCYG0BxDleeZa3no1oUipB9T4plPhZxDvMs/t
	Lkf74u2Aj6mgSKneppwN7LVLAbDzF/oLHTDn0YOn32Fe11mbpz0xtJOVMzbKc69WyJ2pmrEfie4
	xCEg/Pr3KtaXo0FGmfhVZB362nx+hPoYVkRqxhgzE9JN7n/RHYLAfQQKWfzeSEw/i+nrrTf/zjS
	PBJXnWA/A4Kcr1tnrr5fPUy0leUr+pK/RPVuNXd+k+33A/pJA6bRvb4Rrf5cZI9v8wKv9wcKR6D
	3r257+KDOuqTWKshkuBsb2PjBZg==
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id d75a77b69052e-507528db6e5mr222734631cf.58.1772572549595;
        Tue, 03 Mar 2026 13:15:49 -0800 (PST)
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id d75a77b69052e-507528db6e5mr222733911cf.58.1772572549028;
        Tue, 03 Mar 2026 13:15:49 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:47 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:28 -0500
Subject: [PATCH v3 08/10] rust: pci: add num_vf(), to return number of VFs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-8-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
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
X-Mimecast-MFC-PROC-ID: qOxf-kqKXYQgEw6g0iJkujKEa3xJMgbK4a-cABXU7R4_1772572550
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
2.53.0

