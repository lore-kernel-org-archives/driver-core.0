Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4B3C3BFA
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572549; cv=none; b=n8jppGowkTyw3uOYhlbCi58FLWCZZN9t68RV3sgceSFwx4FAO9z66h7fw74AJLjo/6zpIlAqq0VrMZOo8QO2XRp5v3Y/QuubB37wwt/0A4GMgzjDfLmqtVY6R/h4+L1KY1E6g2YPimYbIfz0TcUD7dltHde0gjOwqBlxbveSTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572549; c=relaxed/simple;
	bh=lJwT02KVG7/pESXAOG8cyaW742ucvP9hALO2Uv3N7Ys=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=LrA/iA1P5NEx0qHwwrDimm6U2g4WXBeq0QR66+7hO3nBNgZRByORru3QgqWlqisDJGFQIuGehzaHe9EN2S8z/oJLDC5Dh02t7N+Gb7T1fbKbMq1iEtb7aN5siCuSyuzRYpiwsq6T1V9p79oVKUj4Rn3VKHAFAPyzwZdu4MyxF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1agVTT1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1agVTT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
	b=d1agVTT1mdHe2RTcnyqqu47Hr+4NPzeFPlaO7lQyK+XY4kfWdXgMB6RgxkSerwvoVXRE5B
	bzQBh2MkjW8m/GDJNVnETrOz8RimqCb8sEYaJAY+ml/0X9z0zZhuljhtltUpDz67JKk+CP
	zkn9swyNG/bYIi0VCEWI020vrHOh9JY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-LWbXEC0HMlKHsg-_niCcpA-1; Tue, 03 Mar 2026 16:15:45 -0500
X-MC-Unique: LWbXEC0HMlKHsg-_niCcpA-1
X-Mimecast-MFC-AGG-ID: LWbXEC0HMlKHsg-_niCcpA_1772572545
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f619264fso177751766d6.0
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 13:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572545; x=1773177345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
        b=gcWS9EUGgRh9THQ5STo59NIrCjsxVBOyAsv9trdbuQi4bYsOBim0SgtgdM0xVvCXwm
         HCMDOlH1gOGbZSLRrXcRYYnNZkQxIiZWIQJJJlRfMR7wWrWpJgvoR+T6rAwMe5V6hWRO
         P2BeSkewg9UZ4nWFjZtmXC/iagZseuLzz+9nyZZt5r5hbj+ZYNr0V+q9+XfqlSrrOEDg
         4wFlrN6gio1oJzsfKlCQR2GPCJdWKzUTaVCA/8FJF6MzhCzD3PPDIQbQB4xu9VhJRVXA
         XciZgBxx3vnxZMIHcWqNsbm0aTBly8abYJmrd6zHeWgqUX/BDvWsQgIitCmy68TXj50O
         A01Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxUfVox8vo9miVJPqABZk11hiCYBB5Nz4jclDyPklEHXnIjigBYVZzAcIu5aIolPc0bEswwR7vOVjQVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx2sIZXcgc04FgxP8T9KcKw6Va10AO5fx0EWQkOjYs6Y+hZn44
	BIAYEUNn5lbhGn0tnkAXEH8lOLiBQlF+jAYPZWZMYMnTHYBNfcsvxQb+uZIkkeVNbptn20Ww/7g
	130EiKip3yRHFGRMqhwlHLFyr9oyEc7OBP7MTsTdB5dEd45z+aVyCRhQWj53+PiI6
X-Gm-Gg: ATEYQzxPNdjbT1FJbrULCLwWjtt+xkVHlQGBDn+SKEc5syRo4ZmS2LMyuHeOHbxaSjM
	O381O+T34xru8KPb0kS7dRysSrZGRPGoyuG/FbepJLpLpqnLHFTv48i2faofkbz1fMIWa5qGd12
	9yHEPvZ0S9vEIxJnikjHpnG4XcfwIE7aIC7vrXmMNN7KVPCwtxLtluTian0RKI2mFp2QwYqVg3c
	UBGP+9zi1k/ksiueV45M+mdIzli4Kf0lN08lnPhbtgKZQfETXYCCNPRXTu3To/ihETnXfWH3Nru
	pLN+/XVskOZjnS4mlM0UQrQPpbymJ5bh6+QSZOoZ4UIKiEbhUO7uncbX95kk9O6m1VqaT49d/2k
	1HgKasDYrkbKcvcE8Z6/9+dye1w==
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id 6a1803df08f44-899fdd6a682mr113463626d6.4.1772572544952;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id 6a1803df08f44-899fdd6a682mr113462916d6.4.1772572544344;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:26 -0500
Subject: [PATCH v3 06/10] rust: pci: add is_virtfn(), to check for VFs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-6-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: eHLvLjxrNWFVOSlVjbwbWzGlplEEUSxZPtWmDpvo8po_1772572545
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
2.53.0

