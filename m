Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946063DA7F9;
	Mon, 12 Oct 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814400; cv=none; b=SoYWrMBAXb57akzAM1SI+61cy7MSp5BSfgYUJ6GSe8nzHoFtfIU0hSp0xFlIUfVmWcv9eq7Eo7TSS+zzan/mVMh9uXakc9Fa89MEUhok7feuursEmhewBnZ4vwcAW0U9j9HH8iMebex6hFHBF0q/x1XZITyiYE0N/mfNQT0+GJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814400; c=relaxed/simple;
	bh=G/lRlB+nrrUKjEMQnMsa1t12Re3YEvbhanwCkyoVtlE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BjvbSjcb18jfyav8KA6aqzswbFZGuXYkUv/VQt4hmGLPgy4a4kGeS1ipjQln9ABEj7kNMLQt/x0KDA4y2ksgryelXrtzHGTSoGr1KILLPFNmh3jULVBMh1rH3ojVMJ5eckM2EeHWrmUCWA1S/0RJBCu1lwh19HpOIr2khfzU1GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPnXpaYw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPnXpaYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42BC1F0089B;
	Mon, 12 Oct 2026 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791814399;
	bh=MOQ1cWzQbLG1gyaIvqWjPDjDImUywyKwLHUtDFsFLsU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CPnXpaYwbSncWssQn6PPNgh2q/vA7QyjuJ/tXy5MxUF4qyK5thrhoCKmYUXS79sgY
	 G/MXCPZZRWL9qkzwB2EnoECsGttBnI5C1rtfTjkb3WcZvuWZivJMz3nsH/DAQRlBzb
	 GvG9bCr0xQBUaf8sJkpJE+dGMKtfF7oUBUaUnvn+/OFr4i9NLEyPLoSnPj0isDYgOc
	 At4ibeIJdGduuww8j3dpkyI4gOCzudrfH+O/a1vZ1KNaWzcoSK4mPxe/CnTrKbrCdb
	 KWDxp9VkUIYmd16fZP8phLrKyzyuTcSA303a6R36OIW5/Uv9QQqErsMRumA4OO7W+2
	 A/hR/zCj36amw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 16:13:16 +0200
Message-Id: <DM2X6XX7EGLN.38C96USJFEV4Y@kernel.org>
Subject: Re: [PATCH v2] driver core: Take parent lock in async device attach
Cc: "Mario Peter" <mario.peter@leica-geosystems.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Alan Stern"
 <stern@rowland.harvard.edu>, <driver-core@lists.linux.dev>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
 <aszXeki0LK1LYL6P@hovoldconsulting.com>
In-Reply-To: <aszXeki0LK1LYL6P@hovoldconsulting.com>

On Mon Oct 12, 2026 at 2:50 PM CEST, Johan Hovold wrote:
> On Wed, Oct 07, 2026 at 01:15:14PM +0000, Mario Peter wrote:
>> On buses with need_parent_lock set (only USB), probe() must run with the
>> parent device locked. A synchronous attach after device_add() gets this
>> from the caller, e.g. usb_set_configuration() holds the udev lock while
>> adding interfaces. __device_attach_async_helper() runs the probe from an
>> async worker instead, where that lock isn't held, and only takes
>> device_lock(dev).
>
>> Take the parent lock in __device_attach_async_helper() as well, like
>> __driver_attach_async_helper() does, and move
>> __device_driver_lock/unlock() up for that. With this the warning was
>> gone in 300 boots on the board and in 6000 iterations in QEMU.
>>=20
>> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for =
drivers")
>> Assisted-by: LLM
>> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
>> ---
>> v2:
>> - Describe the race in more detail
>> - Keep the multi-TT detail, but say why the hub has to be multi-TT
>>   for this symptom
>> - Reproduce and test on v7.3-rc6 in QEMU
>>=20
>> In the same QEMU setup, a debug-only device_lock_assert(&udev->dev) in
>> usb_probe_interface() fired on every async probe of a hub interface
>> without this patch (52 of 52) and never with it (0 of 102). The hub
>> emulator and the test scripts are small, I can post them if that helps.
>
> Thanks for fixing this, USB interfaces should indeed always be probed
> with the parent lock held:

I was about to pick this up, but can't this cause a subtle deadlock? What i=
f
async_schedule_dev() runs synchronously? Wouldn't we then attempt to take t=
he
parent lock again while e.g. bConfigurationValue_store() already holds it?
