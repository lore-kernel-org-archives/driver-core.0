Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58C948096F
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540026; cv=none; b=tOaxvjVXSt8+7N5RTT16orp6FanYJBbnzmeKw7+lCvNGxHNtUr4soNhDyH7u1r8M6mL0b4G7KF7OdvVt5/VUeY5j6M8xAsmOfsPkuYRrxHTJL25H4oDdMe8zKNQbOxnrukJnyK2/v7jX+D0A86LqBTt7OMYPGJpVZXUTMSswh6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540026; c=relaxed/simple;
	bh=jqtuzC0nR43l61D6gvcZaII5xgpzEmMh90Esg3ewQrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxm7KQqEXUpHCrY2jz5QUgpEipcsgzHSbbYGM8DBbw+cC/8puzXRyJz8ZxTcwr4LA6qSPfx7w1K21Q4QgXuxvzFFUBJ3/6PX7qpYwjAcTXBcO0EaGnEcQ/pbtLPwlbGeTwqdCbipi0Lf6GfRxd2DiaActC/ZWItOf8P2EZJisP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tSOTZyvK; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tSOTZyvK"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90f9f8553e0so14613136d6.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540024; x=1789144824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=tSOTZyvKsySYfqwJ63D6Cjzb2LjxT9lWhDpIG4V4EweLOJva2toy4lW5EdhhktLplA
         TWPKATuQU7P/vEiFBa0oV345o2Uhov47g/H9mp5MGZoXN1D3l8tzGjw3vhEevX6bK12y
         QgwUk48u2ztjPDN4fuCO+qJFRPAJVHhR4O8EF3wspt2xKaySvV2OIzS1oGTI+8Ctp7r3
         S0/GXYAD/6HBkmIhalPiePzZrcwsR/3X5q+GjIwgbaTN27Qe+G/Za3o/Xb0Crc7aFB1T
         wwpBoBk1Afc6Q2l+P+lTDo6z2c5/yq29KsAi3MJBX7W3rK3G7EjEFVkU3xkQWfvar/I0
         1uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540024; x=1789144824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=saWRMKnTTFRPAoDZ8hkrk5iusksbOQ9VLtXe90EvL4l8M135/Zz3vWmjNygYNWmgrw
         lUb76q5O+QHLjLOSRBRpg6ShMWOaMtb3uDt3HIsB7B2BYtPhHazchYJKNpQFQOpNWhzk
         DcWI4smdiOCAJolEGADdjtGqzGQmRjuyatnpWT91Yk5Erqk/GK7V+Z0rcLguJKiTPc4B
         rUiMnjZTtqsIn1wZICCd6yZWKvYjigrgGiVT39cYfSclT6vcI7jBOb3ZgNc3YdpoJA25
         TlRTedCMxboc06kSrAMYBIgQ62uznpqdSG8058gYpCHtW+FVdv122D/yRo6i882/zVkS
         SKKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP5DCTgOM+azNNe/1OKzYKCkowT7f9Is0ruj4UVOvCy8qAMjvBwl2IgHNPhOcFH6yhRguL2yw8dTHy/Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lqiTEVX19QlYiTe9K3/igRChU01RZlDKSUoJY8/KllqJA8SL5E
	sllr2tdC7RRIOtEJnJwcriH64zWuhM8GzazORSXJBELVTXDyWVLTjTDxw1UZQ6hL4A==
X-Gm-Gg: AYBFou0tU9k8hNvV7dd9ja/gu3ZF7mskotziYDyCjdv+x8RK6imyP/xeKStRjnKhW3t
	06jKRpSlysTd2rE/YwYi0X5G/lS1BpHvLR68QZxrwqZlwjXkRCMeIrBsAAUxXReYyQUCdql2Xfn
	NqkQe3CCM1mF6T3T0xmmtqPlCUQaWCSMlwNK5RKmGBdnjI98UgB5E/Jl4uUOB4nLaZjds9Ad08c
	9iw2vOnck8atnjTWpmQfpLVQqibJQ1kKhIIALl7BQOui05rxmljX5H2NFNnHLOVhE5mrwSBlNS3
	B9x1TifUHdMIi1EAlH23yP0EEnTW1haM/VFXpt0veHWeP0RM/8whcvc7sB46TRx2Npi2N+25l4Q
	+au3x3k4HENHLxShKNL7zGEgr8/u1TDlPELG6kiw9PFYnVCiFVJI/eMM8cEN/QXZb5jh3doYMMl
	ITmhK3aZdrCP4w0iBnf7ZvTh6NHH9j6i+ktU5m2Pb4J9fVBvzoGkOHu6sLZI27cw==
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr706361285a.16.1788540023360;
        Fri, 04 Sep 2026 09:40:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm246420885a.14.2026.09.04.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:40:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:40:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <6bc3c29d-aa38-4e59-a4f5-2c480ef9c748@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

> diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
> new file mode 100644
> index 000000000000..00f7500af336
> --- /dev/null
> +++ b/drivers/usb/core/port.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * usb hub driver head file
> + *
> + * Copyright (C) 1999 Linus Torvalds
> + * Copyright (C) 1999 Johannes Erdfelt
> + * Copyright (C) 1999 Gregory P. Smith
> + * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
> + * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)

These copyright notices are entirely inappropriate for this file.  As 
far as I know, none of these people wrote any of the code you moved 
here.

Alan Stern
