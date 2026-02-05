Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF633346B2
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325239; cv=none; b=Ts9yDQKclR9vTt9q5tWG7tQanQcdHPjcGW0jgVvwFIGCVZjnL1pTgurCfHOqe1LXWMsr/rFTmT4tRfUawPuNZkvmHTKpwvzpwYzLJivOdjOoHlm8gfmZEKpNrlWg6alq3rgCLy0/otZpVWcbXGJirSDyk9UjUW3UAk1TekYuwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325239; c=relaxed/simple;
	bh=0n3HUB5a0dbq5Vp3zcn3fKughLCja0FW1cbYz+y6V0c=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=rzWOJzewZVKsjQKBvFL3KYzAFLy3hslEyQMiJxRp66qREpNVUVUvhvMxRNsN3VygykhyTY83j4CS4ixxBiDBXCMNah4b2tNgh2VtJhj3h2sR/tCl0wSsWNeqxiabA93TMTofP/sW7aKVQ3sCimub66aN9PkRlqgMHPyiGw0Rlz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKgYTKIa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKgYTKIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
	b=TKgYTKIagQzgoevET2m//g2JtXHhJCVNh87Em6wq2A1dloyovrDLyTKFOCLrbxVleOs4jU
	gEEXoZkSaZnbXnH7FWOqXkAut0HW8v+oZZoXBKCpyLkCpqbTQD6pxdfBWcfhUeAywKEDW0
	zObbYb0ROjSfnGQA3xjczr/iSoOy3Kg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-3sDN9e0zNMGEqqcmRYH9mA-1; Thu, 05 Feb 2026 16:00:36 -0500
X-MC-Unique: 3sDN9e0zNMGEqqcmRYH9mA-1
X-Mimecast-MFC-AGG-ID: 3sDN9e0zNMGEqqcmRYH9mA_1770325236
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so469341485a.3
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325236; x=1770930036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
        b=CgQQ+lo9+ZBO52ZrSBMlz37rUipJ2VeGf7G6ytoiihIoVxkzoIcpzxt1Lf4a9eJk0K
         VrrxhaK/zDZqLUzneCJUv7p58p0pIA/1jJZKQ/ZIfCNellmGEmMhEvhbLfo+Wt59uRGR
         ADgDIrLGBcFzjgNHH2ADSqc2dscrxG4RL1J35muk/74apYyftDa9YIUHtWlayHbg4ktb
         BPP7xW0296wD29AKa2BPN1M2tGN/YlF6jkLx/p59mlwD5hUV9vGoRSoPP0iLx6cxp9Nt
         dsRTPTyrBrPCnCUpE1hVVMI79WYBaER+zd4u6+R691L4pA7SgBYU1vXJlJURUSbA4gBm
         oCHg==
X-Forwarded-Encrypted: i=1; AJvYcCVhtNCcgLzoMJy3hghIroWllz7v/1yLiCNf78fWa5g8j2ZPh4rLFIFrO5+SXnZvl610T4t/QvvpcnB1nw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/VBRJ6I/z5pamW37+VKn8D8NzM0TdrzSDe1zsH/IfN+pkk3YX
	cyvBUS7Sk/khciguURzKj2O8/j7yOuEWgrHqCTyJY4Zrwr4p9acUj7bWW6J7QJ0d6VfRGEpbw13
	lpDt5NuCMoGdUbfEz0OTR54erO6wdtXR9DY6GU7OyP5KqMvQMLOES9HTC+UFd4BlN
X-Gm-Gg: AZuq6aLK5OjU1DaEIB9qulp2scnUVQ7T6KlzqbUAyyr6YlhpAJilh/1v/7pkKwSZMug
	epy6FFfjaZWLOZeLi02zZs5qDpKD55f6/RcDrgsoiQo6scjcXeoB2u+ojbgsoHucpf/Ynri5clz
	YgviTw4f9jyPcG4MKMkoLQUXpRYEwvrAvvQqoYpoCdI1xmpbBY7x7d0bxSmKotpQ+xGax85J6PE
	z8q0YHHxEGtJh2pppz7WSK9QhEnJ7j5pnnVAMHy+UJWNLueALuj5H2dzY2PkvOh6twqaf7uz15z
	qWacwzRQ5JxIysYNhI4IutRUNzltwAsXO89aRnlh3STebIzbhQdcgLoUJxttoaEIrXyfNGi7DPQ
	S+orm02SJmjaSFDE=
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr61792185a.67.1770325235682;
        Thu, 05 Feb 2026 13:00:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr61780085a.67.1770325234922;
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:54 -0500
Subject: [PATCH v2 07/10] rust: pci: add is_physfn(), to check for PFs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-7-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: uxy2HxUzDzd_znFd1xPOvUFVloHjGgxi-rUkBu51PSs_1770325236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to check if a PCI device is a Physical Function (PF).

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn().
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index db05641186c3a42922e2b6a463de9c1b099a4673..df39ad3f0d5fd898b034609efb03368f83c2a2e9 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Physical Function (PF).
+    #[inline]
+    pub fn is_physfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_physfn() != 0 }
+    }
+
     /// Returns `true` if this device is a Virtual Function (VF).
     #[inline]
     pub fn is_virtfn(&self) -> bool {

-- 
2.52.0

