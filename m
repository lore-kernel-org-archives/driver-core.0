Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617E12F8EAC
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783986673; cv=pass; b=IvJIuYl7Od04CxuKdq3IVRggTtVbBbuqovnMTkFXdiI5dlqSsywi9hVBtfJ8ruhOl8jzymHds9bP3nXmRPSStTLTUKx8Cu/I8lboxootF9q1StgPN0n31d0SxxBtyZF69WiHtweUe7E6uCSAWL5a3RM1khzyccnNrp9vsWF9X14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783986673; c=relaxed/simple;
	bh=7zmJ8jKVFKhmbPh3lplx4ZiebSBRiV6qSBLY8IH2ook=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R81qFQcoJHPhVj3SaDy2RZTNfniOvEMz2ASCa56B4ZXhHsEe5vhDpVi1/fpo+WiK3HkKm3Rf1ZS/vxQGHLbZlioEiVLm0tL1D/Ycst8lkApVrmrP8WlSZvN7tMBEX8zy/HIg7AhEoMtgp8l4oQMmOelEwPdVVoFBPRsnCYJBT7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYh7yu64; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYh7yu64"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso5394365ad.0
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 16:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783986672; cv=none;
        d=google.com; s=arc-20260327;
        b=C7ooPAnorYZmqHSt1On9P0drhfbpftLJ4XZXYlLoiasG7lbvWGbvI7hicwPcgE7OKd
         RL0GgN0uuSql65g1jrGvapDhm8wYvUFPjNg3Ew5pw75D3mewepXEj0WIzkyEBZYF/RmS
         RzBk9KDgOwKsG4wQsevENZWQnwnbF1jZKgihGGklwQXycX2FIMzNPhWvlNEapi4Y3S9p
         L8SjEPw7p8qBmfztYciXZ6stDcMtBPbh3Lzw6pVOB4UIrY2T/0iaLO8u8COG8YThkwy+
         Ev0PtGrrVR9n+iYsl71eiGISLDOb+iKnWJNfr5r2d8YZCc5T8W0qy/1KRW3AeLYIw6zb
         5Tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivaQUJu/mRyfMnuwfBNsGTkWkGDvNgiNwDOd9icGQ3M=;
        fh=8FX5mcjcHVjrR/4DEsOT9dhTa/lQT6EHTY31t9GImRI=;
        b=pda0aC0pRCJ3RyqXhl3wW62dh1rbz/Br7IWsr+XEBYshW72X4hUPTSei3VkNBEyrrZ
         pky5D1KX8Wpsvqbm7YzLzFqzqoSOVRVPpKUIKy3xiXXsLMnu7/R8uiQiygbJtW8iVcgW
         3GfL3YrM9XI54IVBhmdIzBd6jt6zG3kURcHozJYEvv12ntgiivpq5yn+oLth8Zchfjp6
         m4tSQoREVeS/Y7dsqwXLFVYyhqJ0e66Y8VtC9VWcRjZHxbsBzh8Qe0aD6nkGgZDxQ7Ns
         jO+oC/NDK34d5rxLu450ldHoTmn//Qb4QoQxyFBJdanFv8ofyPBcSzTBHah8IZJKAeCr
         doDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783986672; x=1784591472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivaQUJu/mRyfMnuwfBNsGTkWkGDvNgiNwDOd9icGQ3M=;
        b=LYh7yu64B8ix96JLHKHRbm797DwvsroUNyvc5he7PVMoaP/nXL/KtA11vlACh0zoNh
         Q8VrYNbZsZZ+CRIdwoonHiQ3703Fs0pT7+5TMQliyvmsqyuzBde0/nEif0cdD+GW1mxC
         AOeDFEoOR5V/GerLoXf9ffpnmX4rb57GHkW8Ik8LrNBpBG4kqSmWTdTWoV9aMHWBKTBI
         QpvByOjjX+Nkuc7AKR5XKjXzsvk03i5KW8KftvkD/hcnhletVyc1tdc2FwmugtkpoSnj
         m7mpzIxvcvh9QpPcsD63a2yHkpwAUrf96/P7HPIgNvO5wuEd+sb8ZqybeI5QVuUdFC1F
         DpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783986672; x=1784591472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivaQUJu/mRyfMnuwfBNsGTkWkGDvNgiNwDOd9icGQ3M=;
        b=huSnGesycuhFTKLoVSaMPjcEVedL5z/y/XF989ZIHnsrFP3ZUFxHMYNviapPg6U1yB
         J2JYxEDuLJQimX1zxi320s96Klo/Zhw910NVo194cHoOUiht2NvoU3Baq6ZC49/YcMS5
         PbfyX+YZG5rsl6ddPgJQpTt8bY2dNhaJx3jsd/Gj2p9kw+Nz0JEy6TYvdEVBdEg3yPDc
         XBltzmXxlp4BWMQ5TxA+UmgA2z5hBVhK1AQLlztZqrTUIyIz/TVvIIx8HGClZkOGsFW8
         nyxMTAUvihj2n8K12p+nk7ygrwCg8zRE8u/nNVKg2c5Tx9bO7LfBJKwxQ5vxLfsQRa7q
         0Vgg==
X-Forwarded-Encrypted: i=1; AHgh+Rro0O031D3lvmteUp6Y1R6T2RnsZ6PZWTkIfAHhMBVSgq5Xz/wnGWdco2EtMfGjJICiweLH8PiQ9Kdr7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy8OQrKtagj/Hit0ns6bMe2BMMjU7u5NDIoCrIBZJB3g6eZ5+B
	Ryp+2q/3pygZi4vVk34iTLet2f7oHs8SO9J/OrbVjqSidS+yQPZAU981RYoWdqJMGOkMZDmAaZP
	7prwiIS2iQowaqCzJ+30xwY/L2Ub0IldJiFW16yPs
X-Gm-Gg: AfdE7cmxCum6h3rIYuSaH23dqCZXy5e6ghPbi4BDCiQQmOhIF8qdAev4o9r6mc7eqeU
	/z2hGWz4yctBgrJ02DIL/7gdASUJ4rQlJGfDCyC5Y/kzvfMvMw+GDzEhlm/alecvb5wsnEb9YR+
	m+d5VEqFLqTIRllVw7pIVvKqhZnAP/wHiK56Pr3biDT7Twj7rzFOTPectYrqQzUvH6glouI628S
	S/mljSfNg5x4pvf7EGcGk8nMf/TXui+di/I3Bm2ClFoK8a9bg7VLTYvgQdWt4WqCT0WA/Ui
X-Received: by 2002:a17:903:4b2b:b0:2cc:db7a:251 with SMTP id
 d9443c01a7336-2ce8285a73bmr140395465ad.2.1783986671057; Mon, 13 Jul 2026
 16:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702174033.32116-1-sakacpav@amazon.de> <2026071004-strum-perkiness-5d9b@gregkh>
In-Reply-To: <2026071004-strum-perkiness-5d9b@gregkh>
From: David Matlack <dmatlack@google.com>
Date: Mon, 13 Jul 2026 16:50:44 -0700
X-Gm-Features: AVVi8CcmTY0c0Vp441sR3RbEM49xvL1OMRcgoloehgq4aoKMDkzxTiu2LMLBmtw
Message-ID: <CALzav=eCzxZ5980kazjSUDFn1d4Dz+cWbyZyg-MVMca9jntn4Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] driver core: defer per-VF sysfs creation for
 fast SR-IOV bring-up
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavol Sakac <sakacpav@amazon.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Alexander Graf <graf@amazon.com>, linux-mm@kvack.org, kexec@lists.infradead.org, 
	nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 7:16=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 02, 2026 at 07:40:19PM +0200, Pavol Sakac wrote:
> > Virtualization hardware keeps increasing in CPU-core and VF density.
> > Kernel is trending towards preserving VFs using LUO across a kexec
> > which will put SR-IOV in live-update hotpath. VFs must be re-added to
> > the sysfs tree, along with its supporting devices (e.g. vfio,
> > iommu_groups). On production hardware a single VF can consume ~80 kernf=
s
> > nodes. With thousands of VFs on modern hardware, hundreds of thousands
> > of kernfs nodes need to be created, which can add 100ms+ to the boot
> > time and to guest downtime.
>
> Hundreds of thousands?  You have a hundred sysfs files per device?
>
> > Proposed here is a PoC of deferred materialization of sysfs files until
> > first access to avoid cost of kernfs node creation in hot path. In the
> > reproducer below using a synthetic VF to isolate the sysfs overhead,
> > the per-device sysfs-creation time is reduced by ~74%. It exploits the
> > expected access pattern of hypervisors, where only a subset of device
> > files need to be accessed to attach a VF to a VM on the hot path.
>
> Ick, that access pattern could change with other users, this feels very
> fragile.
>
> > To allow lazy init scheme, a minimal set of files and directories is
> > built per device: a device directory resolves directly to the device's
> > kobject and is used to materialize attributes at access time. The
> > access is trapped in kernfs at the dir-read or path-walk stage and
> > depending on the trigger, either the full directory or a single file is
> > materialized.
> >
> > The changes are two logically distinct parts:
> >
> >   1. Refactor of hardcoded device_add / iommu_group sysfs attribute
> >      creation to a table-driven form to allow walkability of all
> >      attributes and single point of definition for attributes
> >      regardless of lazy opt-in to avoid duplicate definitions and
> >      associated maintainability issues with it.
>
> This is probably a good idea anyway.  Want to just send this as a series
> to start with, so we can take that?
>
> >   2. Lazy-init infra to front-run access to device files at lookup/
> >      readdir time to trigger materialization. Opt-in per device: PCI VF=
s
> >      and VFIO devices opt in via device_set_sysfs_lazy(); iommu_group
> >      opts in at the kobject level.
>
> This is going to get complex.  Where exactly is the bottleneck?  I'm
> guessing that systems with that many devices also have many hundreds of
> CPUs, right?  Are we hitting a single lock somewhere?  There have been
> changes in kernfs in the past to split up the locks to be more
> fine-grained, perhaps that needs to continue to solve this?

+1 I also am wondering if the time can be eliminated entirely instead
of deferred.

It would be nice to have a section of the cover letter that explains
where the time is being spent and why lazy initialization was chosen
over alternative approaches.

>
> > As a PoC, the code does not yet follow this logical structure in the
> > commit sequence and likely does not yet cover all corner cases.
> >
> > Synthetic reproducer measurements
> > ---------------------------------
> >   devices   per-dev time   total time       kernfs nodes (base -> lazy)
> >   -------   ------------   --------------   ---------------------------=
-
> >      500    31.8->8.3 us    15.9-> 4.1 ms     36,417 ->  3,922  (72.8->=
7.8/dev)
> >     1000    33.2->8.7 us    33.2-> 8.7 ms     73,427 ->  8,432  (73.4->=
8.4/dev)
> >     2500    32.8->9.1 us    82.0->22.7 ms    184,421 -> 21,925  (73.8->=
8.8/dev)
> >     5000    33.0->8.7 us   165.1->43.5 ms    369,401 -> 44,406  (73.9->=
8.9/dev)
> >
> > The reproducer is synthetic: an in-kernel module registers N unbound
> > platform devices (60 attributes / 4 groups, ~74 kernfs nodes each; no
> > config space, BARs, or probe) in one timed burst that models SR-IOV
> > enablement. It runs as a two-kernel A/B from one vanilla 7.1-rc2 tree
> > (eager baseline vs patched, plus a patched/opt-in-OFF arm), 20 runs per
> > point. Measures only sysfs-creation slice.
>
> I sure hope sr-iov devices are NOT platform devices.  If so, please go
> fix that up first :)
>
> > Deferral removes ~74% of the sysfs-creation time and ~88% of the kernfs
> > nodes. At 5000 devices that is 121.6 ms removed (165.1 -> 43.5 ms) and
> > ~325,000 fewer kernfs nodes (369,401 -> 44,406). The table-driven rewor=
k
> > adds a +7..+11% eager-path time overhead to non-opted devices.
>
> You're just deferring this work to happen later, so when is that
> "later"?  And what about multi-threaded probing of the bus, doesn't that
> speed stuff up too?
>
> > Available as a docker image that orchestrates builds in qemu guest and
> > prints results as a table (x86_64 Linux host with /dev/kvm assumed):
> >
> >    docker run --device /dev/kvm ghcr.io/pavsa/linux-lazy-sysfs-vf-bench=
:7.1-rc2
> >
> > Assumptions / Trade-offs
> > ------------------------
> > The saving depends on the access pattern of hypervisors, and on no
> > component walking the whole device tree on the hot path to avoid full
> > materialization. Both are expected to hold on optimized hypervisors.
>
> Hah, as if.  Many userspace tools, once a device is notified, walk the
> whole tree of it to read the attributes.  You are going to be fighting
> that problem constantly...

This series could still benefit Live Update scenarios where the
initial userspace stack is small and tightly controlled to resume VMs
as quickly as possible after kexec-ing into the new kernel. It enables
userspace to decide when to incur the cost of creating these files (or
never create them).

But I agree that eliminating the time entirely would be better.

>
> > An actual production hypervisor was observed in local testing to
> > materialize an additional 5-10% of total nodes on average on the hot
> > path.
> >
> > Overhead: +7..+11% eager-path time overhead applies to every non-opted
> > device going through device_add() as all struct devices traverse the
> > walker and can't be gated under a config option.
> > The lazy opt-in infra can be gated under config option to have zero
> > impact if disabled.
>
> Again, where exactly is the time being spent?  What lock is "hot"?
>
> > Final words
> > -----------
> > This is an RFC to first get feedback on the decisions taken at driver
> > core + kernfs level before engaging maintainers of other subsystems
> > if we want to pursue this further or pivot to something else.
> >
> > The code is at a proof-of-concept quality written with AI assistance
> > with some known limitations with main target to gather potential
> > savings and initiate conversation.
> >
> > Feedback appreciated for:
> > - table-driven attribute refactor targeting common device add path /
> >   suggestions for more efficient/less invasive approach
>
> What's wrong with the normal way attributes are defined and allocated?
> They should all be tables today, and the driver core creating them when
> needed, no individual driver should ever be doing that on its own.
>
> thanks,
>
> greg k-h
