Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9234245008;
	Mon, 13 Apr 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108358; cv=none; b=Saw3G2XMcVVrmPuVRBiDCTyq/U4inEIXsBfujMJm+SCmeAtKpFW/cQ9GOLVIqLFKIBjFXD8L2TTsqLAz5jbC0X+PHcLW4R70i3zXik53Jnz8xrn7J6NdqsdQJB46AUTOn1ZdggN5eH8ovmtEiE7nRfvBGMKtebbr+BF/ErYMuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108358; c=relaxed/simple;
	bh=BtrbNACcfk3e+ZL1jIJug2fKZPNOgd6+igTaLvLWoSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rorNCEz0FNwmrQazSMQ1my62wEpEiZ6Hg/FbpYahD/HiJhG6fPsDZ4WGAZzpW1F/TRWDsEwiqTgBBbRMK+MrshQMf5PiCq5hsHQZQvZ1lW3hUgLqNDniFUmtkArWxk+ddIzTKjNwIH+9QpXvCr2bltK6U4BpRy5s76Q64U5xeTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wcqRnOcH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wcqRnOcH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4jGdOh+vng4cl9+KN6W+vqm/LoGy3g4WWyB8ZMDUOSQ=; b=wcqRnOcH5yJ6UcJho/WcxIbxxR
	Bf17nm3VWDVRLXa5ADwl8BzWxXhd442Rm8chOgrM53FTMvdeJvOmj7kBppWb8TdmBtu7G1QACpZt6
	vEF7cJqkDERKRC2zykzI9WSLoghrTdwKYHsxI8H/PrtF4U3CPGJL+yXzr7Ul6P3SjuSTLZvZGyk+q
	0lbiIDz66KG/YNG8Ksq/UWL2DxeW/ilOA/BcqStKe8R5hU+B3FvZJkgy9q+xYEfSOTdn0yv6ghgC1
	AH31aUkwAkKAfewp9kZBGoomweYNVSWt7crKKZafrsMBH2o+T3cO40Qs56pyY4+Fp1JrAJYgq3772
	sfYGlBmQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMur-0000000GIhz-1QEr;
	Mon, 13 Apr 2026 19:25:49 +0000
Message-ID: <f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org>
Date: Mon, 13 Apr 2026 12:25:47 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 13 (new htmldocs warning)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 driver-core@lists.linux.dev, Douglas Anderson <dianders@chromium.org>
References: <ad0SNjugVvkAwhok@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ad0SNjugVvkAwhok@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/13/26 8:56 AM, Mark Brown wrote:
> Hi all,
> 
> The merge window is open, so please to not addd any v7.1) material
> to your linux-next included branches until after the merge window closes.
> 
> Changes since 20260410:

New 'make htmldocs' warning due to:
commit a2225b6e834a
Author: Douglas Anderson <dianders@chromium.org>
Date:   Mon Apr 6 16:22:54 2026 -0700
    driver core: Don't let a device probe until it's ready


WARNING: ../include/linux/device.h:519 Enum value 'DEV_FLAG_COUNT' not described in enum 'struct_device_flags'

-- 
~Randy

