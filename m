Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF2348C61
	for <driver-core@lists.linux.dev>; Tue, 19 May 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197670; cv=pass; b=NB9uB3IGSQdjCCHvlBHItxb4BuWLd0aAJLpu+KYPQqzCeYfq/ffWPs4+6fJbnwLhwtXzVO5rxvf9qiYlmcz4h9UUQGNOK6nJlwbjzWkX7NhU24WhWZAQpv6QrxRFOVe3DN0WcIGb585DJt0QkoCVyYc7aO6yJeEfwFT2vzyLMxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197670; c=relaxed/simple;
	bh=naF+eFIBVaPQxxaOGNrVUV2zt+dbyRkLeG9JHqTunLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghcEnogt2OitBNsYdXMz627IpPLM8JyuYs4aw95Q4JBM8Qxz2aaMYmWckKXkyAQcqpDHy9Iu0dk0sN0dnc+1Q1MHj/akkZ+rsbP1voJxjSfUcTM0wY6WvsVQjc1aOty9fkoBxnYfpNshm6PaO9xFLVnHpt5p/MQdM5SguOYduQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF8WuwN7; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF8WuwN7"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so236992eec.1
        for <driver-core@lists.linux.dev>; Tue, 19 May 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197668; cv=none;
        d=google.com; s=arc-20240605;
        b=dXLipSldgxud0XK5ZrvQA3LDxZGk2N0bOMeXsQStZY7ylbT/ZgYwWiufF6eQYnz4BS
         62RrVduoC1427pDSnh2RSNj30nCO4EsjkF2kS8LEgvA1uSdXLZSw0TgDbRapaQFf2paw
         i5lrn9PJwB+BBtbS9zJjuxeIe4fVDpE8fCWTK7aAihTP5aMG0AOIUnW7PMaf1e1EEBJf
         qlfSOoBnBwNlK/pufCkPRITmP/6NVzXyWcsThUosMXyFAA0/sVAqNt/SMuhN5MpA079B
         uEs7IS/LeH7TYkMALSLnGWpSDxNzO1HLCwD9E2bTcmb4fwl4FLPnTVA9clgVhOVjcXKg
         oQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        fh=GD9BQs5HSv97XL/zaeXd7jzBXE7B3IoPcgBrln5WzJw=;
        b=SpxlCXBJMkTGFzVoikyC6zXyh8AY6A7BgmzP9mGxyGU2hWhDfkVMLVXk9Gbl3wRg9a
         6dE2pabFFE3d1VBtmIHYuLqisFSx9dP8cK344XbNxZOFmjzPK38xBFjsii+VJ97Pet5l
         02n/PSm/3Ucd9m4NIUIM6QV21p4IhuZg8zdR58erelQLw07HZdKXXXLjyS1rmifqaAeJ
         kj1uCMZ1qToOnfQkitrDsUtrT8xn0mkdwy5XsURRoc6RJ6eoiLLuowlawvGFasxpMZLi
         2jVCWjlnjcj0Fc7PWjm7FR56KVwTrbHbMzcb/8sNFyxhjuTdLnZAxTlDfsYQbPANkNCs
         MHkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197668; x=1779802468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=gF8WuwN7mWD8m/vETmLt4t1ewScdBsX72ZlZkTAZSYtQDaT2Et5FMQfAK6c0rDtZZE
         fPaeukeGTmZ6VWJEeun/Gr7IszQBrAtepA1th5Kavg/N++2rHkm3gdPOr2UHNVnWecFx
         LrRA9TbG1OQKdWKUhhhFIt3SuQIlTuthUQg4z/4I0zsIPtpFgPPYfpr9ics6I3zaNkir
         CSTbUEHZzBk12PK/JGr3TaAQTJwau4ay69z5Codm6OGAkz+hJLU7ozG53oNXQOt8Grpo
         ewg3Y1ZF33bC7h3bOj4pRbQIt7FudNXx9hhznA/GCaYab8WhmnfFI3djvBLsQZfPHXyI
         xHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197668; x=1779802468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=qUJUbXIgpL7Hu0Kj372+iyf3tzFSMLDH756toF8Xmhb+rn02lj8M6KxQ1trjn1wN1e
         7uPmEmnCxffEeu9NWfwcPaOwfTcn9s4DI/GG4Ou0GVghNd9xkZ1hCJER0jeF/KZSPCpr
         20S3gFqHXpyNDlRcqY3H/z+UlSVLqzmqHJBRBuMGG5SS060VrI1wWp1wr5Hyx85Y6KDc
         aLc0/kSuRoEiHNboMi74na4iac4apkBcoLzQoLcZuvvKDyn9GcX+wLZ56vxVzttL8GfZ
         aqhLkWvv/bE8q0i2eMRAn/cGZXMxAP+JrXTCNLzwm+irKEUckQrrEOSi4ur+A0pYg3Jk
         7Dmw==
X-Forwarded-Encrypted: i=1; AFNElJ/HJ4IX0ZHX4wxtZmpdo4cWLKJzRfjj6GUeX6xdsZKahqXBhSB5291OuFciVpucPpE91SlOCQOzelbx3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOMqMl4F4TxhQQj+YrS7W4Ri0NIJ1v2bRoaMe4rfebPDxZoYXV
	Xl8SLPih4hlJqIE11oNNg5WS4KIkcRzG0g83cSyHsRvYxSK7Rr08URKIpA6jmdc6AQup2zQE9jt
	cned9eJ9zlk7yTvAchHFF6Vn0s8H+PBM=
X-Gm-Gg: Acq92OGxMQ1vbgZwrFS3htQ+QH/0DSncnR9OTDs/xs8uzMhudUTki8adF72wk/aSNsc
	AxBshQCRzll7Fl9c3Go7eKtAHDpY4d2j3DX4FN5EdEh0N36N0J/S+t/JQ03odU5dCN2vzU528gW
	/dySE3vWVeen8Kjp+8C9oLg4HRlz2XXISrbe1q1gMIstQ/581febYbByQYfLTrdI8gM+1k1mNhF
	ZTuzarl/1Ky/9GISFif2qGykRPTOov/CNghQuQBLspemkTb78oAhqqqiGMwOzOd+UjJzW+m71Dw
	gVnWnGMviptmIk1wlmevSb6X6F+wGSIsQgobcR0KHT/OCG/TYm4/RQsb2/JtQdIk1eKLiMVqf2k
	ywFao7l+sDJd60rnAPgHB5J0=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr3989391eec.0.1779197667973; Tue, 19 May 2026
 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517000149.3226762-1-dakr@kernel.org> <20260517000149.3226762-17-dakr@kernel.org>
 <DIMLSVG1IO07.28UMFL4GTCQG4@nvidia.com> <DIMMHPLUV2LK.39WF9SGO8TLK5@garyguo.net>
 <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
In-Reply-To: <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 15:34:12 +0200
X-Gm-Features: AVHnY4K5vpbJGhCh2fM0bDGLH-gDIENRDMeBQsxYOoXtqTcl9WixZ1bWmTIZnkI
Message-ID: <CANiq72myVDq9oLyyZqUf3Se9-JLDp=qGhBJy01nOxMaZBRxADA@mail.gmail.com>
Subject: Re: [PATCH v3 16/27] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, aliceryhl@google.com, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, viresh.kumar@linaro.org, 
	m.wilczynski@samsung.com, ukleinek@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, abdiel.janulgue@gmail.com, robin.murphy@arm.com, 
	markus.probst@posteo.de, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:03=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
>       That said, I expect LLMs to be (heavily) used to write drivers, and=
 LLMs
>       are typically trained to be compliant. So, I could imagine that a p=
rompt
>       along the lines of "Can't we make this work without unsafe somehow?=
" leads
>       to an LLM abusing this, while going unnoticed for the user.

Could we steer LLMs to avoid that? e.g. adding a line about `Unsafe*`
items to Sashiko's prompts.

Also, a `checkpatch.pl` (or similar) warning may be doable too, since
false positives are OK there.

It could go to the ASH (Acknowledged Soundness Holes) list we
discussed some times if we end up adding it.

Cheers,
Miguel
