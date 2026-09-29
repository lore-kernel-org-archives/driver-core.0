Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD37AA9E
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703978; cv=none; b=NegjrRGmvOdfFjsRbPM/VKK5u4BsZGHbtkZ5z46pWCJT6a3/vTp3XXbDmnipD5ha6FAKrp3BAx0Izecx44H/khkxUjoPe1QoLlkbaIKKz/Dj7w1/jchXJ9XLs1VS4gjr1UeUj7ZkYLKOz8kh4ur7tVCK1Xy70aezx11NrHnGtiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703978; c=relaxed/simple;
	bh=pX0O1N/iExQoutAb2M1W6KhpTgI/Vgqip3LabVNat2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WliKhi+Xtw92MZ2sM4wKBvNjJrH6iH0A841STHZNl+Ke3BRcRjoUE0XniZBQHH9nBMi8R1GueqOj/5sYESuLaG39AnK1rJDHHPadeTj1MV5X3LAH8XfeaTSeyiZxI2M8EXy/bmdp/skU/SlCsmPWUARM2JkvP4fIsCyTrE3IoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=klTKBmeb; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="klTKBmeb"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso4758674eec.1
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1790703976; x=1791308776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVgzFvrslYB1Eb5rNO5WS9AESHYq7uJ3gpsSGpcF1Vw=;
        b=klTKBmebexX7KkIPsG4h+7Sm+8J4cTC9ew4mPV/wAIj9OsoaokpJbt0vyWlKcz30zq
         i7WZuuIz8CPe9Tz6bjz4kE+f04efIMIIiO8la5W9hJ/Gn2OzOEzlBDpIJHN1PkSMXDz7
         4YgLzGsn7D8G82ZXOaD7UtChWWISvT+4Vm2oClZLuhMY6G74wTxFZ0ZW2eewwGTDTm6x
         giSjbibc2toUYmugvNdRy47Y7R50KWesYFWB4v9tTv6xKNP+SwmepfkPyhkuh24wTFE2
         d+G3u34zXBdNG4Zd1YXB4YhLPsDlpnk0l5CHK9BxujD2Wt/HRAhz6wuj1HYCqr/CReRF
         m+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703976; x=1791308776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVgzFvrslYB1Eb5rNO5WS9AESHYq7uJ3gpsSGpcF1Vw=;
        b=JantIHoIhtS0kPVAQe0V4P1mpkFshWP305phgVB/eCVDmzsa8VxTDseh6jQLkp/POk
         0DvGYkpAQqFL3Ab/yatkagGtkAG5PrnDpb2FQEnzb6+8yQnouPKsQ3Ss8C8SQNtCUFCd
         c9hjTA4GhND8IQceFJCDbWp3dZHmvtW+p7UqNkHumF5aOqjOO9Q2bjg47pXii1U7Ehyg
         F7S8WuAO+/pxYsby4LywZz8nsSqO32sXJOabbuV0+y9Ky2zSB5DmOcpC3bDVI5eKPjYz
         TnUkMAMc6DaCGRutshWzoF9dtgdiO16XloLUmM3ASagMCOxnxrblI3OT0AQTpBvEY86R
         +mCQ==
X-Forwarded-Encrypted: i=1; AKwUvByL8Qd4vQkqt1MkDqCgsUb/C+yRQCOUvsIujAR0PB2QSV+Rhk/zr4jmIcVaGoZp3VZpANvoDqsalwzyJA==@lists.linux.dev
X-Gm-Message-State: AFuF++laglK+AIQFBPpUIA6/dw6I1T04Peinz8cBvJhSQYQcjaWD7dA6
	c3wWmNU49zVtfKTsigcZ71tuVsVDSaTE116v4/lryOrE0J03DW9URjAK8REaN8u8RuA=
X-Gm-Gg: AYBFou023/7PeSwGhJE7kaRWw6Vo44rYLXgGw7B1qo+VgptJNjr74EAQDN5B2Ya662e
	x4LzQT3YTotm1iv4nBj06UwMcG+da3rcghWAVPqGob/JpuVDC+LGIznwjyuOvxxtXZxS7M0geHj
	ClueVG71f+o/v9KTWBLf7VTtAz1fqqKxozVjZXeCi5hbK4YPeGP7S2Qfcyx6MU8bOAvgIm3PPoq
	DMzt1fxvL1h8w2/bdo3aPqN2QnkMVyJ+Ol3oH0P4l01Rly4N40Jia0RK2AhqG0O0xYr3KsjIxkX
	jZ2XtFcX/bfrdjVmZD85aexYDsNgLDI9WCHHfMn59ayegnBXUIhA7VGNzNQ2Gw74PrJ2r40fMwv
	V+iWZBM2O58ws+WtSp/RuLkwvgnpSFo3XsYUecQlVopvwUsqBXsD0oOUxhFL3DFg4TlKTXoLtaw
	qh0t/rmeDz3B5rJSgou782bq2REInC+AQfNmvRUhwWUQtQUVuog/MMkXkB134KIur2SkxucPpnv
	pK0XltQkFN9qZjps64kn2BKSTHZ2odmP7A92a3SiEvA7g==
X-Received: by 2002:a05:7300:51fa:b0:34a:cb0e:f4e5 with SMTP id 5a478bee46e88-34c6827ffebmr46251eec.40.1790703975628;
        Tue, 29 Sep 2026 10:46:15 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-34c32072ee7sm731120eec.0.2026.09.29.10.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:46:14 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	me@kloenk.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: io: Fix `Region::drop` releasing nested resources from the wrong parent
Date: Tue, 29 Sep 2026 17:46:12 +0000
Message-Id: <cover.1788901318.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending this because I think it was lost.

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential
unsound behavior in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/io/resource.rs:

Io resource regions can be requested beneath a specified parent 
resource. `Resource::request_region()` passes self as the parent to 
`__request_region()`. But `Region` does not retain that parent.

`Region::drop()` calls `release_mem_region()` or `release_region()`
to release the `Resource`.
Both of these functions start searching for the region to release 
from the global resource root. They also do not search inside busy 
regions. So they may not find a child region if it is nested 
under a busy parent. This leaves the child still allocated. But the 
remaining fields of the child `Region` are freed, including the 
`name` Cstring that it owned. 

Therefore, for nested regions, `Region::drop()` may fail to find 
and release the child region. 
This can lead to resource leaks and leaving the name pointer dangling.

Here is a PoC to demonstrate this issue:

// SPDX-License-Identifier: GPL-2.0

//! Demonstrate that `Region::drop` releases relative to the global resource
//! root instead of the parent passed to `Resource::request_region`.

use core::ptr;

use kernel::{
    bindings,
    io::{
        resource::Flags,
        PhysAddr, Resource, ResourceSize,
    },
    str::CStr,
    prelude::*,
};

module! {
    type: ResourceParentPoc,
    name: "resource_parent_poc",
    authors: ["Priya Govindasamy"],
    description: "PoC for releasing a nested Region with the wrong parent",
    license: "GPL",
    params: {
        start: u64 {
            default: 0x1000_0000,
            description: "Start of the temporary 4 KiB iomem reservation",
        },
    },
}

const PARENT_SIZE: ResourceSize = 0x1000;
const CHILD_OFFSET: PhysAddr = 0x100;
const CHILD_SIZE: ResourceSize = 0x100;

/// Obtain the underlying C resource pointer from its transparent Rust wrapper.
fn resource_to_raw(resource: &Resource) -> *mut bindings::resource {
    ptr::from_ref(resource).cast_mut().cast()
}

struct ResourceParentPoc;

impl kernel::Module for ResourceParentPoc {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        let start: PhysAddr = module_parameters::start
            .value()
            .try_into()
            .map_err(|_| EINVAL)?;
        let child_start = start.checked_add(CHILD_OFFSET).ok_or(EINVAL)?;

        // Check the complete parent interval too, since __request_region uses
        // `start + size - 1` internally.
        start.checked_add(PARENT_SIZE - 1).ok_or(EINVAL)?;

        // `Resource::from_raw` is crate-private. This is the equivalent cast
        // for this out-of-tree PoC.
        let iomem_root_ptr = ptr::addr_of_mut!(bindings::iomem_resource);
        // SAFETY:
        // - `iomem_resource` is a permanent, valid C `struct resource`.
        // - `Resource` is a transparent wrapper around that type.
        // - `Resource` uses interior mutability for access to the C object.
        let iomem_root = unsafe { &*iomem_root_ptr.cast::<Resource>() };

        // This parent is a normal busy region reachable from iomem_resource.
        // If the selected address conflicts with another busy resource, load
        // the module with a different `start=` value.
        let parent = iomem_root
            .request_region(
                start,
                PARENT_SIZE,
                c"resource-parent-poc-parent".to_cstring()?,
                Flags::IORESOURCE_MEM,
            )
            .ok_or(EBUSY)?;

        let parent_raw = resource_to_raw(&parent);

        // This call is safe Rust. Because Region dereferences to Resource, it
        // requests a busy child directly underneath the busy parent.
        let child = parent
            .request_region(
                child_start,
                CHILD_SIZE,
                c"resource-parent-poc-child".to_cstring()?,
                Flags::IORESOURCE_MEM,
            )
            .ok_or(EBUSY)?;

        let child_raw = resource_to_raw(&child);

        pr_info!(
            "resource_parent_poc: parent={:#x}-{:#x}, child={:#x}-{:#x}\n",
            start,
            start + PARENT_SIZE - 1,
            child_start,
            child_start + CHILD_SIZE - 1
        );
        pr_info!(
            "resource_parent_poc: dropping child; Region::drop will search from iomem_resource\n"
        );

        // Region::drop calls release_mem_region(child_start, CHILD_SIZE).
        // __release_region starts at iomem_resource, encounters the enclosing
        // busy parent, refuses to descend into it, and emits:
        //
        //   Trying to free nonexistent resource <...>
        //
        // Consequently the child remains linked under `parent`.
        drop(child);

        // SAFETY: `parent_raw` is still owned by `parent`, which is alive, and
        // no other code modifies this private child list during this PoC.
        let child_was_not_released = unsafe { (*parent_raw).child == child_raw };
        if !child_was_not_released {
            pr_err!("resource_parent_poc: child unexpectedly disappeared from its parent\n");
            return Err(EIO);
        }

        pr_info!(
            "resource_parent_poc: confirmed: child is still linked under the original parent\n"
        );

        //check if child's name was freed
        let name_ptr = unsafe { (*child_raw).name };

        if name_ptr.is_null() {
            pr_info!("resource_parent_poc: accessing the child's name now is: (null)\n");
        } else {
            let name = unsafe { CStr::from_char_ptr(name_ptr) };
            pr_info!("resource_parent_poc: accessing the child's name now is: {}\n", name);
        }

        // Clean up the allocation that Region::drop failed to release. Unlike
        // Region::drop, this supplies the parent used for the child request.
        //
        // SAFETY:
        // - `parent_raw` points to the live parent region.
        // - The exact child interval is currently a busy region immediately
        //   underneath that parent, as checked above.
        unsafe { bindings::__release_region(parent_raw, child_start, CHILD_SIZE) };

        // SAFETY: `parent_raw` remains valid until `parent` is dropped below.
        if !unsafe { (*parent_raw).child.is_null() } {
            pr_err!("resource_parent_poc: explicit child cleanup failed\n");
            return Err(EIO);
        }

        pr_info!("resource_parent_poc: explicit cleanup with the correct parent succeeded\n");

        // This parent was requested relative to iomem_resource, so its normal
        // Region::drop path is correct now that it has no child.
        drop(parent);

        Ok(Self)
    }
}

impl Drop for ResourceParentPoc {
    fn drop(&mut self) {
        pr_info!("resource_parent_poc: unloaded\n");
    }
}



Output:
[423973.510861] resource_parent_poc: resource_parent_poc: parent=0xff000000-0xff000fff, child=0xff000100-0xff0001ff
[423973.510929] resource_parent_poc: resource_parent_poc: dropping child; Region::drop will search from iomem_resource
[423973.510985] resource: Trying to free nonexistent resource <0x00000000ff000100-0x00000000ff0001ff>
[423973.511029] resource_parent_poc: resource_parent_poc: confirmed: child is still linked under the original parent
[423973.511032] resource_parent_poc: resource_parent_poc: accessing the child's name now is: 
[423973.511055] resource_parent_poc: resource_parent_poc: explicit cleanup with the correct parent succeeded


Priya Bala Govindasamy (1):
  rust: io: Fix `Region::drop` releasing nested resources from the wrong
    parent

 rust/kernel/io/mem.rs      |  4 ++--
 rust/kernel/io/resource.rs | 38 ++++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.34.1

