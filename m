Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534610;
	b=jOSD8BVRd9AFuVrEQaK5hAjzHrQnUqHSG9c9PfdnPeRdy2zbCPXgTp44UbQKIwMTfNJA
	 xt4wdX8Ff4cW9SnphgNklI8XZc+wufB6NU9POto1SlrkNZ91oS5eb1S9NO8GFA00z6D7p
	 nkrIbkgakfZ8DrZXog/66MAcsuUFMYxZJ250TsVr0Jdu8Wgd3aL0KNcDi/WDggtkLSq8z
	 UzNwF0RUOkxZgcCZNTJsNbi0oNqQYPINCdYHNugoqgZL5B7XvnmZ5qoA6eOlp3mk7X5zF
	 OpVc7QWsWcYxGdQcwvWV/BueP1HoBkuYbn5BNUfnpr8JNI6Ax36+suPWctCvv/juLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
	b=kH/qdNjkVtKq2L2c8t9LwHHcLIEDsrJQl0gDCuZ8dg+xwjvL8tysMdkjxoU6SD6I7VQ1
	 m0dbZ9oQSNBT5gPtIufTyTjrHjNTXm/WPOw2xk6H2VezlacSERMVoFnjgfH9fuwqztVJ7
	 c2u3+PwjIDRA6lV4lFmMUkSeq6l3LZuiyVfBZYjuTvpbIz+Ap49I2KWsrRU/LjUcNgfZr
	 se1I3UzdU6LL4PY3Mh+OfEfsuXm8ngcqs5n7gs5bTdcXHUtKjsfUrl/WOjKEPuN1n2Zbd
	 kybkCkQo41xS6l+bXESsR8iLsf/Wqu2OldwmEidyKN7g72Gi4B7du3khceLuhk3VPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=VbCCxFG6;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104B606A32A
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 01:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C104B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=VbCCxFG6
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-5187c752f46so212933b6e.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 17:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1794534609; x=1795139409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=VbCCxFG6Z5gIr1dFsTunX1sGFZfQY5Al8Uf0GNjeI4etXPNDbegyLPTgNMTtM/4z/E
         wVC5QpkxCd8MckkA/DbMBM153d1LuMh2XCEJTxUDBG2srByAcAslNcVeg3VBoMQeP2H3
         Rf+0GXLRP/BxPO1aTrDGPxTdxLaDu7NuWCdbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534609; x=1795139409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=ugKDvbyTDEWbi/TIYioeb29+JriHp+cQKMQTOXC3mNa5oga27Optb2gtwudyHQjesx
         CXRT9DgTa8+meRUBvw1Dh2D/ds1kp9KGotbZbVsmXdxKQxEwCENODA78Gna4NQ6snBLM
         P+0UyYBsbNzQjFUGYTf6WjZZH16wYBsqAV4SUgR+T/T/sFxgp9YoeesX0T+6AeFq0fta
         2XHeLIGo758wHTwhExAEHaNDI/rFPx3mNMnSoP3O1mlcdikjlOMidMr5MHq8rTudVmy5
         xk5yWtAvEHLnP72h9Uz+um1auTRQ4SSPbhSYEQto8BvgK4xVQyS5o3Sus//Tzr+eedjm
         0lCw==
X-Forwarded-Encrypted: i=1; AL+hErHGiY9NiHPw7fiSfdju+XNjpFp1/0vmo1haVlrTMutXwfsbiwvlQYrhcxXOuaN97NCMVSfUDWPY1MT8eA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GzYQyu5XH7PWioe2cxAuATcuuVvtZmL00arTE6zSGV2KFQ697
	VU2lt64mV7TV5cM/H5j1+LDorNbuUEPoW81Dl5ovvjhIq2xY7qF+ZL4bQhrirRtHlg==
X-Gm-Gg: AYBFou3rHhmZDo7Rr1jVsgAWpprf8GQFdy4cd+bawy+Stz1N9uX6IliojhVGNyjrs8G
	MqKftTCxaKRybnWn7fv8sGGCKbPZ6/28TD9atziRMQ4Vx25z4cwOPPq3c5jtboVmKrlRoXBGz6q
	Q4HTjhpmaiBjbdcv0muOOkFUeyowQm3M2Fyb4dFbFKzlAjYjpg5cANHTI7NpTth++m5ERAmsZQs
	JU+YXlLBgPxBWqLOWITmQaD4TiONgseildP0VKTtNbTxuvku4jSdvot5kH9quDfUGaZe1uWlLrK
	e5A1QMbkyGI9dcy3M2bY4R1WHruTKq3wPojg6E4QpnUf5I9PmkWHhxaKeZjGuLGqVk6gCXcUSgw
	1rixu65aEpAl0o7NTbR/y0Sv5jNHB480YkWEGCXDCaCBrjPz6WJISJz1fxn9LYqqF1kAPl3oGB2
	FpFFolxfofitSsF8S7oYqOAKx+t8B1OXbetjkzyhneyL6iwGk6NGZUxiU+UMYaBaP09h1pDPGVs
	rJwlIoZBfoGJBnFkDPc0KFamJGF/+Oq1fQ7eTQ0juv3h/7otiGmzF80eBLYzks/yfwENDsu9JTN
	Fc8voaP0FfA35dwoEpgKGR06HALW1xunI2X1IpLTdDMfr44tZSKLQv/AoUicLmRn8/JrHfvssUf
	bLoPxbCMFYVj/CBl6V8OuhlbZgS9zSSASdHHtUi4t7nOVbNBjgTulxB+QLf7FwamOB6xt7+VDfb
	Kc0idoKtwLYPZs7NhtfNKYC6rkTqc8bsKmMp4qReByG7y3pDwqkCH+WUcgv8O3cjk0o75lvLkay
	NcdrqsE
X-Received: by 2002:a05:6808:23d3:b0:4f1:a873:6efc with SMTP id 5614622812f47-56e65a25c0dmr969736b6e.64.1794534608616;
        Thu, 12 Nov 2026 17:50:08 -0800 (PST)
Received: from [192.168.0.45] ([187.14.251.153])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm811902b6e.9.2026.11.12.17.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:50:06 -0800 (PST)
Message-ID: <3e1c4b83-9eeb-4425-8231-216bf6c96038@nilk.net>
Date: Thu, 12 Nov 2026 18:50:04 -0700
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ipu6: Keep psys out of direct-complete on system
 suspend
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
 "Sapre, Sarang" <sarang.sapre@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>,
 Manik Bajpai <manik.bajpai@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 17, 2026 at 04:13:38PM -0600, Chris Simpson wrote:
> Since commit a1fa010b3c9f ("driver core: auxiliary bus: Drop
> auxiliary_dev_pm_ops"), the auxiliary bus has no dev_pm_ops. The psys
> auxiliary device has no driver in mainline, and its PM domain,
> ipu6_bus_pm_domain, has only runtime PM callbacks. So
> device_pm_check_callbacks() now sets power.no_pm_callbacks for psys,
> and device_prepare() puts it in direct-complete.

[...]

Hi Sakari,

Gentle ping on this one. It fixes a regression since v7.1, still
applies cleanly to v7.4-rc2 and to media-committers next, and the code
it touches is unchanged in both. Please let me know if you'd like any
changes or a resend.

Thanks,
Chris
