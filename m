Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D919047729D
	for <driver-core@lists.linux.dev>; Thu,  1 Oct 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853548; cv=none; b=Y6bCWOCDoThZHnO1XV2gc69FZvUtL5tYsgYhkDMfPkZuzgd6NeCxRmUzMvaHa+a6mWIvruYBiSC3Yp8iX2Ph7P98WuoqlcbWcXNQGM4bYCmUXDQ8QN9UZBjVj2f/+0MXkoHG7a0LhcEV+kYwjNwDg4qHegk7DGbCoQd3cD79fT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853548; c=relaxed/simple;
	bh=T5hkxiLK5QweA8xYY2b0kNgTq2KlMqL9lNVwKAsYRXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sQGf3NZHUyClisVGR8XRfFR69NFolajj8DStwjLfr/4+vfDFSSJ5OIxGpB2m7GoMArXqJeX/jbcw9DOO1S6s7oV2n/oAA97sKbkGYn4aUXxiL7MmBwe3WFovkLfjrY7/mr8kJShXH/FhVMddTc2YO56gmQzwA6GnIwyM+KL0XyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1o6PgNA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1o6PgNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790853545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isKKctMTOuNZ2ISnIkB2czFHAzW4g7b0r9h2VTPLIVw=;
	b=V1o6PgNA4zxy+F9XprzEF5YjbxwedLINpdiqwyGa1wuN6xQ/g8dZM7WzX8pvEbL/LC68OF
	C34X2cSzTMPxQuhc4xC4MxHBe5VpJtL+PnQ4MnBKI/3tfKhLkdGMNc8CvGf3+E7+s+71yu
	tZ9RD/qRRjEUnJtx08W/CgojpF2ZDsY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-5Pw8oI2yP9qZ5edOc8xe_A-1; Thu, 01 Oct 2026 07:19:04 -0400
X-MC-Unique: 5Pw8oI2yP9qZ5edOc8xe_A-1
X-Mimecast-MFC-AGG-ID: 5Pw8oI2yP9qZ5edOc8xe_A_1790853543
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b00febba3so1109260f8f.1
        for <driver-core@lists.linux.dev>; Thu, 01 Oct 2026 04:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853543; x=1791458343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isKKctMTOuNZ2ISnIkB2czFHAzW4g7b0r9h2VTPLIVw=;
        b=idjBF1cnKfUNcleWUEyQewCMRHupGyuS/fq76qNomiVc7/aT22bJXCL0iQudCFmDva
         EqElYHw9o7Ihoqj6d7hwwdquhTLf0WjapK+nczZ9+UXiIgFs6oouPdXwgYVr0nWzZXEu
         yG4ui+FECUgUyMfJV++S4Endx0UUvQKNf6O2zY9pljQBb52dK1C7+8bH1I7AImOvCtFC
         LxfaxMCpqFqDHxTu06C7O5wZgOQyxuB0SZZy5H8IH8vjKUdoViCKixtrI9G0RxFqnz//
         JupPyJxEk1xKJ+xNnPseBKwvkod3+3CMilqDNMa3iRaei1zpalMYMu0N4z2vZOthDNoB
         pzWg==
X-Forwarded-Encrypted: i=1; AKwUvBw/S0Qxi+ffdVv8K4hJAui2hCeToOQzKshQ4e1Il9pT2eMtYXR6yHwS4UPLxp/JgcIXAsaeGiIgsE6i8Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYId/3KQVrDsq+qvhDmYGMs95Tgy3997i9+ma7V4z3+RDK6VVR+D
	HD4R2KBA0ntFfesLOg5oFlDeHqa/kEZSjLk7ea9LrTzGsJfyDO7uTLaBrPwlxW3PqC/GFPiVvBZ
	myqgQ0LEw0sLBsdykC9sicOzXTrhZS3UwYlaJ0v9hwKEwN6TCYXGraiQdvTbPYHvf
X-Gm-Gg: AYBFou0yz4HGw0RKn8YhbqFvIMJiuoLOsfeq8mP5GPZzdm1ZQtmA1ZLr7u6F7YYruXk
	032e+hHA7jRMKBmwoLYTAS8Fh62i7ILFJ2mIMDk8bhKT1DP/A+b+WFaTSX7KleZo4pncUDRpSUg
	R0Qkdmf3jTo87Ewk8kjioXkVsFbTivHhWYkBQXyorJZD7MJu5+upK+liN8HBPy2Cenhn/OD+3W1
	ruQ2XJAYPxxIc9uFjVjVOrzr2uKtAjjsvIObDZ2RH6hnQOVtm9QFrz8oGQDbkYnQquc1heS4NoH
	FCV2H+8DFSxg6ZO+gFQmWfTTF1eqDRpwq/7kB6gKZRPeon6S1KyfANfnvtWx35PjSqi2G8wNLK+
	xWi7BUIyxr5e5eyawk7jhgL3eD16RobsRWxbIPq3sv5ihqq3S+7CU1ufCLkTArNMG8iwiYXTBKw
	==
X-Received: by 2002:a5d:5849:0:b0:487:27f6:a4e3 with SMTP id ffacd0b85a97d-48b0253d698mr7951994f8f.51.1790853543342;
        Thu, 01 Oct 2026 04:19:03 -0700 (PDT)
X-Received: by 2002:a5d:5849:0:b0:487:27f6:a4e3 with SMTP id ffacd0b85a97d-48b0253d698mr7951958f8f.51.1790853542917;
        Thu, 01 Oct 2026 04:19:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff96dsm5707719f8f.8.2026.10.01.04.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:19:02 -0700 (PDT)
Message-ID: <80fdcb30-be96-49da-8499-2c673e95b75b@redhat.com>
Date: Thu, 1 Oct 2026 13:19:01 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 0/6] net: dsa: mxl862xx: devlink flash and
 rescue
To: Daniel Golle <daniel@makrotopia.org>, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
References: <cover.1790426599.git.daniel@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cover.1790426599.git.daniel@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4kBvnhXRh4U3BJyZOunsI-r3SnIABWrzJjXZMRurcA_1790853543
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 15:48, Daniel Golle wrote:
> This series adds "devlink dev flash" and "devlink dev info" support to
> the MaxLinear MxL862xx DSA driver, and makes a switch stuck in its
> MCUboot loader recoverable through the same path.
> 
> The switch is flashed over the loader's clause-22 SMDIO download
> interface after the firmware API has rebooted it into MCUboot, and the
> driver reinitialises through a deferred detach and re-probe once the
> new image runs. A switch found in MCUboot at probe registers in a
> reduced rescue mode with firmware version 0.0.0, so the same flash flow
> recovers it; an interrupted download is drained in the background
> first. The deferred re-probe comes from a new driver-core helper,
> device_schedule_reprobe(), which the bound driver calls without a
> module reference; it also replaces the open-coded self-reprobe that
> iwlwifi, hci_h5 and btintel_pcie carry, whose work function frees its
> own module text from under a racing rmmod. fwupd's devlink plugin
> carries the matching quirks [17].
> 
> Patch 3 is a driver-core change and patch 4 does not link without it,
> so the series needs a driver-core ack before net-next can take it.
> 
> Tested on an MxL86252C switch of the BananaPi R4 Pro 8X: an upgrade
> through fwupd; an unbind and a reboot issued while a flash was running,
> which wait out the transfer and announce the wait; a host crash and a
> power cut mid-transfer, recovered by the background drain and by the
> rescue path on the next boot; and an unbind and a reboot issued while a
> background drain was running, which abort the drain at once and let it
> resume and complete on the rebind or reboot.
> 
> Changes since v17 [23]:

Out of sheer curiosity, what represent the number in the square brackets?

More feedback from clashiko. Requests about comments clarification
are IMHO mostly pedant and could be ignored, but AFAICS there are a
few actionable items on patches 3 and 4.

/P

