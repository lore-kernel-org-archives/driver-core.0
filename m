Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275368;
	b=BPWOZRlaxYq5neEWKxGATa3+8LxMarxfKqOUW2O+Gf8l3IBizXfdhdGK9+kcGofdPEbb
	 23uLAOdtQIFlSwyWmh/3RA8M5jyRf9gu8A2svBhYpBiehsxGeb0S6Q8w8lFZpm9kd7XAF
	 AneIZ7ix/R+HGLNWIRT7QYtBCinElw0GY0uG+y890UlEvsg94p4bvspqQqM1ITv10ZmAu
	 amVPIKrC+X52yk4Q4EAAbeHh7DRB6Vku6ocdKLIKh4DveiL4pTPRccmkNjbLVKn3m/Q9D
	 7AyuX8WlWmqJRyKs2lbVZqVJ01DrqXn3/+IVzIeU8zEtErRYwGmFLnFLpHmHHZHvddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=T8Eng3qwLEeUoVGvRshX3rc6PfkWjqVrwxy3a8uah8E=;
	b=LIVkEFCSI2UrvGWw+EjjdsjoSg8AdcZZhRg7rgFtY98C5wRaXbkkz/vTZgc+ZZsi94pr
	 G5RJKMgTN1W+cRSZ8gTkBuKDdp+Eg86nIUNkG++jDV0BFctYjimUzD4sUkpgZnqXnx/FX
	 5LyGIbaMoZS2dig4rw2brvG8vJmqr0uh+Vs6HvRzWXjxcWXrbiyQdSdqRiP7pZrNyFc5H
	 oDdTq66RJbWDxXIUQ5RmetlxgAGwW9y2YioxLGk8lhk/U7JjGIqYWEmzYCejg6PxnpoUV
	 +aIc3Ek9squdZDc2JdXpSk7Bii7LaK84iVO3q8sz/u8uxEB6rl3rDd2wLk40WirZzWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVshlDIf;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B5606A31A
	for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 12:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVshlDIf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275368; x=1824811368;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Jr2MXl655ILtgT8HMWCdbmGSBcxTaDURabb84rT89Ow=;
  b=HVshlDIfwMq7dWyS01r21mm6Jr+jt/Mx7JadIRclyT4GcS9RGNW8cshO
   l0dPgzL1IGG52XslL4X7/1j8h1QTZuYyQxX2idTk/J3iPIyCPtUPKdmRs
   YUTpIDWL/xfFCdcSX4FjdIBjbM5RyHFpZIqYIecHRe64bIdVKNk9I+7NW
   IrbZPbYbfqwl4oyyDJvsNAuP4jlGxyzUnk3SEtUSOeQuMF9PWks2GJAPy
   pGkTNzzMswYJ3XjcoGqEBFIL1GxOTX6GbQspqNUttOZM0m6QLyZ1kIf89
   J+xQpxns1V9CzQ+afaw6CivTb/hQqE0yDq3QczY8FOcotUftbrAVVb/eF
   g==;
X-CSE-ConnectionGUID: JmD4/b+RSiGex8BlLxtOZg==
X-CSE-MsgGUID: sndWADvERaqphw2Y8VlayQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1892995"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1892995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:02:47 -0700
X-CSE-ConnectionGUID: ifwCoafmRViVOiPhHZbVrg==
X-CSE-MsgGUID: ZIdt35McRE6q3dwbWX6XdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5261488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:02:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Oct 2026 14:02:31 +0200 (EET)
To: Yin Li <yin.li@oss.qualcomm.com>
cc: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>, 
    Shanker Donthineni <sdonthineni@nvidia.com>, 
    Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Reinette Chatre <reinette.chatre@intel.com>, 
    Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>, 
    Andre Przywara <andre.przywara@arm.com>, Drew Fustini <fustini@kernel.org>, 
    Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com, 
    aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com, 
    Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>, 
    Huang Yiwei <huang.yiwei@oss.qualcomm.com>, 
    linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev, 
    devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one
 with resource_size()
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Message-ID: <629fcaca-66ad-bcc6-fbe2-bd80e9822c94@linux.intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com> <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-96330462-1793275351=:1322"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-96330462-1793275351=:1322
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Oct 2026, Yin Li wrote:

> struct resource uses an inclusive end address, so the window size is
> end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
> which is one byte too small.
>=20
> mapped_hwpage_sz is used by the register access bounds checks, which
> have the form "offset + width > mapped_hwpage_sz". With the size one
> byte too small, an access to the last register in the window is
> incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
> access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
> 0xFFC + 4 =3D 0x1000 > 0xFFF and falsely warns.
>=20
> Use resource_size() so the size is correct. The ">" bounds checks are
> correct as-is once the size is accurate and are left unchanged.
>=20
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and =
kbuild boiler plate")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@i=
ntel.com/
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struc=
t platform_device *pdev)
>  =09=09=09dev_err_once(dev, "Failed to map MSC base address\n");
>  =09=09=09return ERR_CAST(io);
>  =09=09}
> -=09=09msc->mapped_hwpage_sz =3D msc_res->end - msc_res->start;
> +=09=09msc->mapped_hwpage_sz =3D resource_size(msc_res);
>  =09=09msc->mapped_hwpage =3D io;
>  =09} else if (msc->iface =3D=3D MPAM_IFACE_PCC) {
>  =09=09u32 mpam_fb_msc_id;

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-96330462-1793275351=:1322--
