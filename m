Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695033031F
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325223; cv=none; b=A2ggtWVGnXG2Rf64xk0icsVJvrJcB00iryp/sNsE3Xeed3kX/y05JT0j0wHvp5nQZl6KM58bGzxQf1IgtxKg9yBxnbuy6NwMpZMVREqinFnsg8yZx/6WXKHLpoHM7ULy1em+4zSKmgmtjOIasyBe8cl9H1L7TyP0c8HeKQxCTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325223; c=relaxed/simple;
	bh=/zc7hnOqDaQfbuR6q2umqihJtzF+bS26O4CjMYiORPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=g+68Ozov83kKpy0SyAqr8EhCBqRbthRiAee2zSioEh3ZUVyOxk0MavBvVtjhDX73xF5ldv0N0bOIodPfBPMXrns9+a9DaNFLN/4X6BhVLSkDQukUofVQjGPxNODw5MfSK4MMZsw3ucfu7Ss69tBRRBruu3x1ITMDwMH3GhiVm1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CbFUBmIl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CbFUBmIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zjDxj9GBrwvwoCRGBKU1o8l9D2Apql2Zga2uAnN0TcE=;
	b=CbFUBmIlOpLjcOptSwpjq72v1Qx/lwzgoPuS1iDjwI6nitdqwcZyB5yfnbQX+juidAp4tr
	xn6qpFZrhY83qwGyjm5rkKLwd7K4vQXezW99fiCdIQBguxmqodgYH2uTG37pCN/jvgTxRn
	/MJFVnfCVpxlHlwbAhOSTTcZrDa6hiY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-Es4QVwK5NaW3qw8WQ009Gg-1; Thu, 05 Feb 2026 16:00:20 -0500
X-MC-Unique: Es4QVwK5NaW3qw8WQ009Gg-1
X-Mimecast-MFC-AGG-ID: Es4QVwK5NaW3qw8WQ009Gg_1770325220
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so350614985a.1
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 13:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325220; x=1770930020;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjDxj9GBrwvwoCRGBKU1o8l9D2Apql2Zga2uAnN0TcE=;
        b=NESCU1RKUw08qIqqYfp3lGdmEqb+xPzizJ7m74iUxHncE6/rzs/ny2QfrdrCZLlOE6
         aZpHZZkf+H1U1BYHyIsRRoCzsJZjIodw6g1PT510azXCkESO47npVVjnj0rzcxDIy0C3
         ME8newmjxgndGD8XH+ZhOh+b98f22zfJBGlAusQoT9QnEHjB0uSJnpFlANG9SMIpDRcS
         0qmq3IUHvHRZBbyTtJfrJ34MQTGHmEX9b9fICQXqEMaFxRlYtcgh1WmqPOCAQZOMhoFv
         eC2P16kvzij1G3bPbuLTSUtMICVdykYVXgp6p8W/+8xKoFXQe1wJVfTPK45Fxb7+Y8V4
         kAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFUlG+cXhACtJJbNNJWfZIqXxAfLzPC1xFrDTa4nnf+dHkbCmsE4EZyTcutpL6Cb57q4L4Ai5Rik8Jpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJx30u4ptX8rk2EASEn/rc3Y+IXcouoxeVLX4qcWZjDFF5OMPJ
	QMPvclU/PD8CgaOFjciFdCjnErppkSUzf2RjC8rEkO1rndyQaNm8yH0AYzzjiL9kq1LbVF1LhfI
	xkwfsPXfgeRY5NcvnsbsJMwbRQVRmk8ELy/OhM8VVIhUiixvzh6G6e86YgW3Cyzn1
X-Gm-Gg: AZuq6aIdA+djpx/tAbRxyuoRyWGV2Jdwrk6c545C62iwYwRNAX4KqTrkwl8tdUNZaQD
	Yz11AJilMSPUPiLUBykhwE867VJlAbugfjEQ3dYw3yF9k4rF8r0N2nnB/lTdYeGInKudJ/jnbpq
	PDwFX2T9yUZgMkxoLZ5lX5fpB+AcFLjktc0skdrBpT2bn4uNf88WlMggunFT3To7epmGzLflqEb
	UUdkla3rSV20MEYEAqXaHeQXEXSYSZy0kA7dwgN0WiY8oqGU6zun63zEY3EsN7/nBnu3FW/xh75
	QDht3CyEK2ZJU++x8jTesODd1H7hCm4+2C1441BmWu1prJJqRjIkw0+PZIISkzcBVZ0JzDWYKtw
	gc6PM6t/Z7TT+Tss=
X-Received: by 2002:a05:620a:460a:b0:8c7:1952:7894 with SMTP id af79cd13be357-8caf0581494mr57917685a.23.1770325219911;
        Thu, 05 Feb 2026 13:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:460a:b0:8c7:1952:7894 with SMTP id af79cd13be357-8caf0581494mr57908285a.23.1770325219041;
        Thu, 05 Feb 2026 13:00:19 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:18 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v2 00/10] rust: pci: add abstractions for SR-IOV capability
Date: Thu, 05 Feb 2026 15:59:47 -0500
Message-Id: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MMQ4CIRCF4atspnYMsKKLlfcwFiM7yhQuBpDEb
 Li7RDurl7/43gqZk3CG47BC4ipZ4tLDbAbwgZY7o8y9wShjtTJ7TK9c8OkFc5JY0dN0s0pfDfE
 IHQXJJab396/qPucf1dr906pR4TSN5HbWOXKHU+I5UNn6+IBLa+0DunqYvZ0AAAA=
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
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
X-Mimecast-MFC-PROC-ID: Lsciun6JZzUkpuCQ3o8LfuN4jPCrSV6FKSsDZeIn7S4_1770325220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
capability of a PCI device. Provide a minimal set of wrappers for the
SR-IOV C API to enable and disable SR-IOV for a device, and query if
a PCI device is a Physical Function (PF) or Virtual Function (VF).

Using the #[vtable] attribute, extend the pci::Driver trait with an
optional bus callback sriov_configure() that is invoked when a
user-space application writes the number of VFs to the sysfs file
`sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].

Add a method physfn() to return the Physical Function (PF) device for a
Virtual Function (VF) device in the bound device context. Unlike for a
PCI driver written in C, guarantee that when a VF device is bound to a
driver, the underlying PF device is bound to a driver, too.

When a device with enabled VFs is unbound from a driver, invoke the
sriov_configure() callback to disable SR-IOV before the remove()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

For PF drivers written in C, disabling SR-IOV on remove() may be opted
into by setting the flag managed_sriov in the pci_driver structure. For
PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

This series is based on Danilo Krummrich's series "Device::drvdata() and
driver/driver interaction (auxiliary)" applied to driver-core-next,
which similarly guarantees that when an auxiliary bus device is bound to
a driver, the underlying parent device is bound to a driver, too [2, 3].

Add an SR-IOV driver sample that exercises the SR-IOV capability using
QEMU's 82576 (igb) emulation and was used to test the abstractions [4].

[1] https://docs.kernel.org/PCI/pci-iov-howto.html
[2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20260107103511.570525-7-dakr@kernel.org/
[4] https://www.qemu.org/docs/master/system/devices/igb.html

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
- Demonstrate flag managed_sriov for dfl-pci driver.
- Uphold safety guarantee for physfn() when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
- Use "kernel vertical" style on imports.
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments for {enable,disable}_sriov().
- Demonstrate how to reach driver data of PF device from VF device.
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
- Define struct MyDriver such that physfn() example compiles.
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn() and is_virtfn().
- Link to v1: https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com

---
John Hubbard (1):
      rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (9):
      PCI: add driver flag to opt into disabling SR-IOV on remove()
      fpga: dfl-pci: set driver flag to disable SR-IOV on remove()
      rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
      rust: pci: add vtable attribute to pci::Driver trait
      rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
      rust: pci: add is_physfn(), to check for PFs
      rust: pci: add num_vf(), to return number of VFs
      rust: pci: add physfn(), to return PF device for VF device
      samples: rust: add SR-IOV driver sample

 MAINTAINERS                           |   1 +
 drivers/fpga/dfl-pci.c                |  17 ++--
 drivers/gpu/nova-core/driver.rs       |   1 +
 drivers/pci/iov.c                     |  41 ++++++++-
 drivers/pci/pci-driver.c              |   3 +-
 drivers/pci/pci.h                     |   2 +
 include/linux/pci.h                   |   8 ++
 rust/kernel/pci.rs                    | 165 ++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig                  |  11 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   1 +
 samples/rust/rust_driver_pci.rs       |   1 +
 samples/rust/rust_driver_sriov.rs     | 127 ++++++++++++++++++++++++++
 14 files changed, 366 insertions(+), 14 deletions(-)
---
base-commit: c5048ddee936ca5ce0aeb79172ce512130779d31
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

