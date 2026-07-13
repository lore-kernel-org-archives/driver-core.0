Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F82E8B9B
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 23:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985902; cv=pass; b=X8+kvc8monXgeN1jo1veagZLFDfi/12OtrZodN+JZlxzdWcO5aGjEBicK6hVzH5J+kSbV3e+Yry+ytndAN4F5OLAlfBT2eQCk3y5Gaesd5TcOmIIXcgkUkQaPHAy49W8jg3/nFKriIb5ByB0cO63Zw6QhszpMYPF85qr0oQC7zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985902; c=relaxed/simple;
	bh=abfciUPTdNDTaxvl/pxNLX1LKT1HPB8fpKzvBRzr+zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDsRddxmpPtKa3OyAoZYpynzm5I1zS5g6SSIj083bj6aelSwwsMTERgtkhS/xo0f/rTjjloTtXxvFaaW7hAHNzhbUP+lRS/PlKiTNflxqUPvNepO5sdkQU9katZPr5xQDlfHHkbasP+y85zaQizFZ3BiT7icrDK9gVhJj8MlAN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLFpiOWM; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLFpiOWM"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so2404017a12.2
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 16:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783985900; cv=none;
        d=google.com; s=arc-20260327;
        b=RC60Wm7nMP5ye0hvRSK7RKLDGbyfJNNh38SgIUuK+h+DLXdcFJXJ9YmcQTsXdoTaeZ
         aJH5woe2iur43mQu/avdSeoeYzxVk0kjfjOGFEADBd1x8XFp0r5YgBB3y0Ie/UvP6Z+/
         YVE/NqQUDeCJkQC+Ma+6yoFrv08ZqnnxNUh/SFIhwS+abC1Zb/i0GhvjdlG60HTB6xhY
         dpXnhd7seM553mVMzhuWvjZU9pDy1c49yeFUTBTne2Wu8dmHOIkbvhsWicUHJIRPGAGV
         8A0StKZt0H5152tkp0PSjN/gEaU8e+Nt6ORFn9ZB1Tyb7m/p/kDdg1oOMydp604fCkQY
         LTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbeC0G2r0+fJphZIiEMA3U3mQUgbuZ2yGF2MPyVi8cI=;
        fh=R0Lt3GVj62iSUtBlAgQWVV0YgcLpZVuTrbPcVc12U2A=;
        b=jheyHrvFZUF2snbswNPHmUcCrWob/Sj9oz6rHRW3AcbIBk+Xe/cDjK68uqbWher0qj
         KSNoeyQsIW7OcSRRbOx8dSD5GyqpIreexh9UiMt0RKG1O1YFaBjgM0NiQyatKwjBLjsk
         AV9VKdAx09+5h/6BXbeV4njna1yObskUln4scVe8tt5NIZfYimS9jmoxz6PFMKkjNGwS
         zmSLGGLFm3QzlGalkp7EbLu9VnrICUgVRMm8P0l+pmFtr9BBW3LotmVSLBeoYh8sYMRy
         mWP7GqbrwpVijuvtZsAxXLSmQ2qv12JbP+exajTvxJ+yMlK5EhsHZT/ri/+xjZi2e0hQ
         HtEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783985900; x=1784590700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbeC0G2r0+fJphZIiEMA3U3mQUgbuZ2yGF2MPyVi8cI=;
        b=bLFpiOWMGgAJVblBSYqu2YZWgg5GeW5b24v/6gVcFjeVxnUFtFfF4CO0vZ62Qeq7wk
         T11MkjII7tU31igo104dRKMPZ2SKxjEJC2qvU3OMkky3SP3eLBymxMM/PlOS8pVNMxZh
         vcWcctiVrocgN73r9YihJ4OMK6NOPg5/PEbmpNDQI2b3HthjzN5EVnybLwLjUkKT5Cce
         MBq+/xpySmZqw6FufA+s5dGWxavNtr10VLroqnCQ12nLSRX0tjAeDGhmKQZBuMl3a0Ib
         voWzLEZ/z3oHOySRi/Xgu/JPXTCgRzzP3fYPPICXmYbSx1mNBM09cM48G8Pkrr3xjXUw
         LzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985900; x=1784590700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbeC0G2r0+fJphZIiEMA3U3mQUgbuZ2yGF2MPyVi8cI=;
        b=rXGZA6I6mNQGxLKi3wQw7UT6RnqHqkMO/3DaDWU5g+TQ1PKBleBiKqMBBKiVRDFpNO
         5Z1TUTcCPUUvJRyyFM5KN6BL3c+HBYmFQFNfyoeiNrZqwf1KK1jnE1Qy4mdEJeRXpcwM
         8pbITTb8G3Jh+jNOcq/5Udiut3S7hPstjHf+djcfEWK7Hz0GTCKTLf8t1gNb3+PPA0qI
         v5BfJ2p62K5w8qt+9cp22eJDPdY/E4oqlCwmShDENrPaZClv4uPxVs6SGsQzFpSBHkRr
         aKh6l7A/eObl+i/SC3+vHQ93KvSV17U21yF2URCCMOeJR2+B+LPsGSKapNr/UV+FlOim
         xnow==
X-Forwarded-Encrypted: i=1; AHgh+RqfyzASOV2fLzLWCx6Hbb70cCDncdWk/lZyhCbqHsK2I1zFPuukVIeKWjPhK7Ij9tWdepORQSgMiuj5HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvl4NWsy5DwHQ0cTUxNASd+QgjNhpeLudGq6gLHJivb+MygyP
	EdqLiauXwjOUQz8X2V1D2cGh7Vla9R9uaWLv0G7RCgCf9DNOKcY+7hUGmE/oknDQi9/xgODsjit
	7zk6IgBgN3R5w++n9+CcDLJJKJeTJddRcTzA8saSk
X-Gm-Gg: AfdE7cmwSQxVbZ+xvyYrkHHxPHm850CNK6JLqStAdbeB7NbiO0I4edpb9OKGSqIwZ9h
	Ogh4GD8C6Q9Aa58zbeKxNXsBCJ7r4Y/PIqBQhmJY7QTD8JC44NOzYZmUHqYvod4ArNWbTJbuLvk
	X/XZ1cBUnr9MuZihBed0zehgxHhY76q0L0KdWS+fVBJQQLhRNkjkth23BLCmQxTOM5LiMpcUwU/
	Kiz4DRnul/ssnF+qsBjveDk8rZlH+e79OghYVnjhGyGsbBG7tIKdkO/xkMILOMHA3IezpPgQp2B
	m5sEf2E=
X-Received: by 2002:a05:6a21:460e:b0:3bf:bdb9:f602 with SMTP id
 adf61e73a8af0-3c1108b79bcmr11388010637.22.1783985899795; Mon, 13 Jul 2026
 16:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702174033.32116-1-sakacpav@amazon.de>
In-Reply-To: <20260702174033.32116-1-sakacpav@amazon.de>
From: David Matlack <dmatlack@google.com>
Date: Mon, 13 Jul 2026 16:37:53 -0700
X-Gm-Features: AVVi8CfY9nmLyptjh2AyzFeGNNgc7oKcQvO8AS5RIIVcrg8HsCOADDuDwJVvlPw
Message-ID: <CALzav=fJrcaOFbP-rpOPeRNW59e0mXCgX120xHPnyrpvNH2JgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] driver core: defer per-VF sysfs creation for
 fast SR-IOV bring-up
To: Pavol Sakac <sakacpav@amazon.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Alexander Graf <graf@amazon.com>, linux-mm@kvack.org, kexec@lists.infradead.org, 
	nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 10:40=E2=80=AFAM Pavol Sakac <sakacpav@amazon.de> wr=
ote:
>
> Virtualization hardware keeps increasing in CPU-core and VF density.
> Kernel is trending towards preserving VFs using LUO across a kexec
> which will put SR-IOV in live-update hotpath. VFs must be re-added to
> the sysfs tree, along with its supporting devices (e.g. vfio,
> iommu_groups). On production hardware a single VF can consume ~80 kernfs
> nodes. With thousands of VFs on modern hardware, hundreds of thousands
> of kernfs nodes need to be created, which can add 100ms+ to the boot
> time and to guest downtime.
>
> Proposed here is a PoC of deferred materialization of sysfs files until
> first access to avoid cost of kernfs node creation in hot path. In the
> reproducer below using a synthetic VF to isolate the sysfs overhead,
> the per-device sysfs-creation time is reduced by ~74%. It exploits the
> expected access pattern of hypervisors, where only a subset of device
> files need to be accessed to attach a VF to a VM on the hot path.

> Feedback appreciated for:
> - table-driven attribute refactor targeting common device add path /
>   suggestions for more efficient/less invasive approach
> - mechanism of interception in kernfs, materialization, locking scheme
> - fit into context of LUO - complementary or is there some other
>   mechanism already considered to mitigate the sysfs impact

Preserving VFs is still on the roadmap [1], but I think this would fit
in nicely.

My plan is to have the kernel keep SR-IOV enabled on the PF throughout
the Live Update and remember which VFs were preserved. The next kernel
would still need to create all the pci_dev structs for the VFs, sysfs
files associated with them, etc.. So speeding up the creation of sysfs
files for those VFs would be benificial to reducing the Live Update
blackout.

I have some questions similar to Greg's, but I will follow up on the
thread he started to discuss.

[1] https://lore.kernel.org/linux-pci/20260710212616.1351130-1-dmatlack@goo=
gle.com/
