Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963816;
	b=ciEe3aSoQhw7eQaBUlMY4/mJOd3U3Em00UXVCdnZfa0vuZvJE7HvcUeMjC6lLjX2KQWB
	 Z10tbPNxpnadVhPQrpOqguMdwQQzIjzR4pUhF1eGVfZ9TAt1fuIh4vhrvtJVNiJpqMzQa
	 vIeBVzOrsdQF/bZpEfzvUNxj8t48oYBrrl+J/IUWqJfXzAMxLZPzmPgPHcjzMrZhqR97Q
	 a6OXfymKZ8sTa/v2Fh4Z0NSeuSjVaLmf5zpvmaOcHlWdrG/cqgk0QNhanw5MFNlckJsTF
	 s8eWFIH6msf0yj5uU6YuHXktemUXc+phOk+ihLcxi8hTIJpYqOw1OdrQgaHvRtaQpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
	b=gQbXOXc8d8ESwXV3F09YYsNdhifUl8XLwE0VPmXpf31tvOiDGl3d9qfYcf4jnVJGQlsU
	 lMD25LPwVMXHJlnA18uGLvSLkv8nuQyqzt3s6pY/c9Pn85lHxmCbLpldVlHPp5iznvdT1
	 9YdOSK+brgRRg2fam9fAhEHI/eF38dI8wBPwWbWX68w8GggQ5Bwld5GsdwfR5uw6Fj57h
	 L30taF4pzungY3b6zV58W874zz+bc2/zZ7Bfk7GUTzEyElFr8fTX51sSUpSRgm2ZX+aK+
	 f/NOdloAoj2SUmmTmKWIPnwEeosnJ6BrPBioC0qZkSJwqb8ZgWtN71e82JD0GNsqetA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="o+O6/9/g";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF9606A323
	for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 21:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DF9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+O6/9/g
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso313683366b.3
        for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963814; x=1793568614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
        b=o+O6/9/gfQBqP/LRr0F2SwGxlhg58Cz6qVSZrcgDkuSXAk4aSg9PcW93wnfVKig4Rn
         8xtRdaN9W0+CSuaOSKtjXPOqD+O0SNZXu7aAEgPwFKGRLXnk6lXRCqBufekwAh6DUfVq
         zuyiYvUjO58b4oEXZuikoDlLHq8LtNNwlAX9/y/ePNCFfn2IKvQ37nUoP/WbyxVWl+E4
         2eadhBECiItM3H3rMDm9ksk+kfsZlcDvptNW/4rU5mW3cUuQnW4tg/Nv6Hcy2HyPIuM9
         XdtQ88HdSqgDWHwGD2EEaPp/FCxsKjGb9/QVmoMZHj3o4FK3p7VOuT9KPXZvAIKduC2W
         oUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963814; x=1793568614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
        b=DdXH85TzL3MUqOl4j5A/5H2oc2nbJeiL5d+QtfGmmC40JRQMbWARWLwoJ0h6/AYAQQ
         0Hr9b7x1n0HQl6gCEFCr/jokfdAxkJWYzaKZpyx971pybr8GC4YgukqleJJexnEe9cGV
         A4ULy4xfVNRAWzbalpbvstkVMr9GSTlntjfJOVTmBd7dtFDixAUCR6oX33NLbPFC0RDX
         dVCI5l/rkkVVwrdDhAwFg9yB8H/2eBLTzR9bNLky3eWlFdV4gtxquXB8Jfk/69M4atZE
         Ndj6FlCFXLwg1HJkm+QDDfJsmvvBrP1qzy/wWVGL79J3QdIaP4tbvwKF3pWwq/bqvj7U
         AeNw==
X-Forwarded-Encrypted: i=1; AKwUvBwhyG+hAvY7nK18GUWQUvVHN5tEAVBWrHiyNnWeK7rPiYROautku2ekbGcFAmrF3wJhXjYswRuKhYvusA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIqz1mj1mqlpV7RziwxkIYLViy8XxLssXXMTQNMl5GauwsNBV+Q
	kE2W5NZGAZyciCr6fvlCH+I6hLidvZZJUks2J4v+l4mtAcHRRtlvOZDP
X-Gm-Gg: AYBFou2olzyzQLvNhhH5EWy/cf9FBK4FE5+9qrhqLsC4mO3y4OzvwyGN6aaiQDUizPU
	tButZDff+Yn/cCrFcEY+kz8DFUWnJz8N+MtAHKyCxsJ7ICbSj4iYKZxTO1B9K2dVkxTUOjk7uww
	sremAM/9Tdzvfwe52X1rwTlzUE26NOOsTmLFCjlQO2FP9MPGj0P8kXFCId9OXv0y8jYCSYtoePX
	LMGLUFpXHeSTQ3LixI1mn9SWfurtaJ7f/G82WVICQWSZIgoybbjB3vEujCEro7wimpag21fJn7F
	9Rwo+pWC1j9ei6YunIAEHUXn99FinH6rh2GVHXpFXHJdWN3eFxftcRJ3WKH/hPt8kdCRXwyvmOW
	IVpP8cO3TY+XtXuLutLH9twhoDyquxT1tAfZcF+68QfEu9NGhAVNlCvrP2alKRS0Axcswnd3BIb
	UZWyi4hZYadANtkyAoS67MqwXtp5DIkwNsrfbfPDbgCAoLF6OUC+ySUfEXya/5z8JJVPJC31ahN
	0Ob2X5HOITLfgvlbsMKmA6EOVECNqYW4DfCH0e795Il7iwIUTVUaX5iH/0MkEI=
X-Received: by 2002:a17:906:dc95:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c46bde24eebmr627862566b.23.1792963813604;
        Sun, 25 Oct 2026 14:30:13 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm243556666b.64.2026.10.25.14.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:30:13 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/4] driver core: add device_schedule_reprobe()
Date: Sun, 25 Oct 2026 23:29:48 +0200
Message-ID: <20261025212948.11474-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4ffa0608d32b6a68e064b41b17b6d35096b9a7fc.1792203271.git.daniel@makrotopia.org>
References: <cover.1792203271.git.daniel@makrotopia.org> <4ffa0608d32b6a68e064b41b17b6d35096b9a7fc.1792203271.git.daniel@makrotopia.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 17, 2026 at 08:56:27AM +0000, Daniel Golle wrote:
> driver core: add device_schedule_reprobe()

Tested on a Dell XPS 13 9310 with 7.2.11, called from the .restore
callback of hci_qca (QCA6390 on serdev) to download the firmware again
after hibernation: the reprobe ran after restore and Bluetooth came
back, and s2idle suspend did not trigger it.

Tested-by: Nikolay Bryskin <nbryskin@gmail.com>
